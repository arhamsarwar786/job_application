import 'dart:convert';
import 'dart:ui';
import 'package:firebase_app/screen/CV%20Generator/form.dart';
import 'package:firebase_app/screen/CV%20Generator/pdf_page.dart';
import 'package:firebase_app/screen/Post%20Job/post_job.dart';
import 'package:firebase_app/screen/home_screen/home_screen.dart';
import 'package:firebase_app/screen/sign_in/sign_in.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/util/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sizer/sizer.dart';
import 'jobdetailscreen.dart';
import 'jobdetailscreen1.dart';

class SearchedList extends StatefulWidget {
  var query;
  SearchedList([this.query]);

  @override
  State<SearchedList> createState() => _SearchedListState();
}

class _SearchedListState extends State<SearchedList> {
  dynamic allJobs;

  // @override
  // void initState() {
  //   super.initState();
  //   EasyLoading.show(
  //     status: 'Please wait',
  //     maskType: EasyLoadingMaskType.black,
  //   );
  // }

  fetchAllJobs() async {
    print("Click");
    // FirebaseFirestore.instance.collection("Companies").doc().snapshots().listen((DocumentSnapshot event) async{
    //   var data = await FirebaseFirestore.instance.collection("Companies").doc(event.id).collection("jobPosts").doc().get();
    //   print(data.data());
    // });
    var data =
        await FirebaseFirestore.instance.collection("Companies").doc().get();
    print(data.data());
  }

  /// Filter Data
  filterData(List<QueryDocumentSnapshot> data) {
    print(data.length);
    // print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%5   ${data.runtimeType}");
    // data.map((e) => print(e.get("title")));

    var allData = [];
    var allData1 = [];
    if(data.isNotEmpty)
    data.forEach((element) { 
      allData.add(element.data());
      allData1.add(element.data());
    });
    else{
      print("Empty");
    }
    
    data.clear();

    // allData.forEach((element) { 
    //   print(element['title']);
    // });
    List finalList = [];
    dynamic filterdData = [];
    allData = allData.map((e) => e['title'].toString().toUpperCase() ).toList();
    filterdData = allData.where((element) => element.contains(widget.query.toString().toUpperCase()));
    filterdData = filterdData.toList();

    for (var i = 0; i < filterdData.length; i++) {
      for (var j = 0; j < allData1.length ; j++) {
          if(filterdData[i] == allData1[j]['title'].toString().toUpperCase()){
            finalList.add(allData1[j]);
          }
      }
    }
    print(finalList);
    // allData = allData.map(( allData) => allData.toString().toLowerCase()).toList();
    // filterdData = allData
    //     .where((element) =>
    //         element.contains(widget.query.toString().toLowerCase()))
    //     .toList();

        // allData.contains(widget.query);
        // print(allData.toString().toLowerCase().contains(widget.query.toString().toLowerCase()));
        // print(filterdData);
    return finalList;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(          
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(children: [
              Container(
                margin: EdgeInsets.only(top: size.height * 0.10),
                child: StreamBuilder(
                    // stream: FirebaseFirestore.instance
                    //     .collection("Companies")
                    //     .doc(Constants.appUser.userId)
                    //     .collection("jobPosts")
                    //     .snapshots(),
                    stream: FirebaseFirestore.instance
                        .collection("AllJOBS")
                        .snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                                         
                      if (snapshot.hasData && snapshot.data != null) {
                        QuerySnapshot data = snapshot.data as QuerySnapshot;
                        dynamic dataList = data.docs;               
                        if ( widget.query != null )
                        {
                          if(widget.query.isNotEmpty){
                           dataList =  filterData(dataList);                            
                          }
                        }  
                        print(dataList.isEmpty)                      ;
                        return dataList.isEmpty ? Container(
                          height: MediaQuery.of(context).size.height-50.0,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Text("No Result Found!",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                              SizedBox(
                                width:10,
                              ),
                              Container(
                                decoration:BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.blue[900]
                                ),
                                child: IconButton(
                                  color: Colors.white,
                                  onPressed: (){
                                   widget.query = null;
                                  setState(() {
                                    
                                  });
                                }, icon: Icon(Icons.refresh)),
                              )
                            ],
                          )):  ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: dataList.isEmpty ? 0 : dataList.length,
                            itemBuilder: (context, i) {
                              return  widget.query != null ? widget.query.isNotEmpty ? CardsDetail1(size, dataList[i]) :  CardsDetail(size, dataList[i]): CardsDetail(size, dataList[i]);
                            });
                      }

                      return Container(
                        height: size.height,
                        child: Align(
                            alignment: Alignment.center,
                            child: CircularProgressIndicator()),
                      );
                    }),
              ),

           
            ]),
          ),
          appBAR(size),
          // searchBar(size),
        ],
      ),
    );
  }

  Widget appBAR(size) {
    return Container(
      height: size.height * 0.16,
      // bottom: 10,
      // top: 20,

      child: AppBar(
          leading: IconButton(onPressed: (){
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=> HomeScreen() ),(Route<dynamic> route) => true);
        }, icon:  Icon(
          Icons.arrow_back_sharp,
          size: 20,
          color: Colors.white,
        ),),
        title: Text("Search Jobs"),
        backgroundColor: Colors.blue[900],
      ),
    );
  }

  Widget searchBar(size) {
    return Positioned(
      top: size.height * 0.13,
      left: 2.h,
      right: 2.h,
      child: Container(
        alignment: Alignment.centerLeft,
        height: size.height * 0.06,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: Wrap(direction: Axis.vertical, children: [
          Container(
            width: size.width * 0.75,
            child: TextField(
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search_sharp,
                  color: Colors.blue[900],
                  size: 22.0.sp,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                hintText: "Search Jobs...",
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 10.0.sp,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 0.4.h,
            ),
            alignment: Alignment.center,
            width: size.width * 0.12,
            height: size.height * 0.05,
            decoration: BoxDecoration(
              color: Colors.blue[900],
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: IconButton(onPressed: (){

            }, icon: Icon(
              Icons.search,
              color: Colors.white,
              size: 22.sp,
            ),)
          ),
        ]),
      ),
    );
  }

  Widget CardsDetail(size,  data) {
    return Stack(children: [
      InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => JobDetails(data)));
        },
        child: Container(
          margin: EdgeInsets.only(left: 2.h, right: 2.h, top: 6.h),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
          child: Column(
            children: [
              MaterialButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.visibility_outlined,
                      color: Colors.blue[900],
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 2.h),
                        child: Text(
                          "View Details",
                          style: TextStyle(
                            color: Colors.blue[900],
                          ),
                        )),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 2.h),
                      child: Text(
                        "${DateFormat('yMMMMd').format(data.get('timestamp').toDate())}",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      )),
                  // Padding(
                  //     padding: EdgeInsets.only(right: 2.h),
                  //     child: Text(
                  //       "Full Time",
                  //       style: TextStyle(
                  //         color: Colors.grey,
                  //       ),
                  //     )),
                ],
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 2.h, top: 1.5.h),
                  child: Text(
                    data.get("title"),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w900,
                    ),
                  )),
              Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 2.h, top: 1.5.h),
                  child: Text(
                    data.get("discription"),
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.sp,
                    ),
                  )),
              Container(
                  alignment: Alignment.centerLeft,
                  padding:
                      EdgeInsets.only(left: 2.h, top: 3.5.h, bottom: 2.5.h),
                  child: Text(
                    data.get('city'),
                    style: TextStyle(
                      color: Colors.blue[900],
                      fontSize: 9.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ],
          ),
        ),
      ),
      Positioned(
          top: size.height * 0.03,
          left: size.width * 0.15,
          child: Container(
            alignment: Alignment.center,
            height: size.height * 0.07,
            width: size.width * 0.16,
            decoration: BoxDecoration(
                color: Colors.red[600],
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              data.get('companyUserName')[0].toString().toUpperCase(),              
              style: TextStyle(fontSize: 14.sp, color: Colors.white),
            ),
          )),
    ]);
  }


  Widget CardsDetail1(size,  data) {
    print(data);
    return Stack(children: [
      InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => JobDetails1(data)));
        },
        child: Container(
          margin: EdgeInsets.only(left: 2.h, right: 2.h, top: 6.h),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
          child: Column(
            children: [
              MaterialButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.visibility_outlined,
                      color: Colors.blue[900],
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 2.h),
                        child: Text(
                          "View Details",
                          style: TextStyle(
                            color: Colors.blue[900],
                          ),
                        )),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 2.h),
                      child: Text(
                        "${DateFormat('yMMMMd').format(data['timestamp'].toDate())}",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      )),
                  // Padding(
                  //     padding: EdgeInsets.only(right: 2.h),
                  //     child: Text(
                  //       "Full Time",
                  //       style: TextStyle(
                  //         color: Colors.grey,
                  //       ),
                  //     )),
                ],
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 2.h, top: 1.5.h),
                  child: Text(
                    data["title"],
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w900,
                    ),
                  )),
              Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 2.h, top: 1.5.h),
                  child: Text(
                    data["discription"],
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.sp,
                    ),
                  )),
              Container(
                  alignment: Alignment.centerLeft,
                  padding:
                      EdgeInsets.only(left: 2.h, top: 3.5.h, bottom: 2.5.h),
                  child: Text(
                    data['city'],
                    style: TextStyle(
                      color: Colors.blue[900],
                      fontSize: 9.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ],
          ),
        ),
      ),
      Positioned(
          top: size.height * 0.03,
          left: size.width * 0.15,
          child: Container(
            alignment: Alignment.center,
            height: size.height * 0.07,
            width: size.width * 0.16,
            decoration: BoxDecoration(
                color: Colors.red[600],
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              data['companyUserName'][0].toString().toUpperCase(),
              style: TextStyle(fontSize: 14.sp, color: Colors.white),
            ),
          )),
    ]);
  
  }


}
