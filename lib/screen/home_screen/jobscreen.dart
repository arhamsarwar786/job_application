import 'dart:convert';
import 'dart:ui';
import 'package:firebase_app/screen/CV%20Generator/form.dart';
import 'package:firebase_app/screen/CV%20Generator/pdf_page.dart';
import 'package:firebase_app/screen/Post%20Job/post_job.dart';
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

class SearchedList extends StatefulWidget {
  final query;
  SearchedList([this.query]);

  @override
  State<SearchedList> createState() => _SearchedListState();
}

class _SearchedListState extends State<SearchedList> {
  dynamic allJobs;

  @override
  void initState() {
    super.initState();
    EasyLoading.show(
      status: 'Please wait',
      maskType: EasyLoadingMaskType.black,
    );
  }

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
    // print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%5   ${data.runtimeType}");
    // data.map((e) => print(e.get("title")));
    data.forEach((element) {
      element.get("title").toString().toLowerCase();
    });
    // dynamic filterdData = [];
    // data = data.map(( data) => data.get("title").toString().toLowerCase()).toList();
    // filterdData = data
    //     .where((element) =>
    //         element.contains(widget.query.toString().toLowerCase()))
    //     .toList();
    //     print(filterdData);
    // return filterdData;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // fetchAllJobs();
          var data = await FirebaseFirestore.instance
              .collection("Companies")
              .doc(Constants.appUser.userId)
              .collection("ApplicationsRecevied")
              .doc("DkRN2fFl43qBZOBwwd6n")
              .get();          
          var d = data.data();          
             var pdfFile = await PdfApi.generateCenteredText(d!["CandidateData"]);
          PdfApi.openFile(pdfFile);
        },
      ),
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(children: [
              Container(
                margin: EdgeInsets.only(top: size.height * 0.18),
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
                      QuerySnapshot data = snapshot.data as QuerySnapshot;
                      var dataList = data.docs;
                      // if (snapshot.data!.docs.isEmpty || snapshot.data == null)
                      // return  Center(child: CircularProgressIndicator());
                      if (snapshot.hasData && snapshot.data != null) {
                        EasyLoading.dismiss();

                        if (widget.query != null) filterData(dataList);

                        return ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: dataList.isEmpty ? 0 : dataList.length,
                            itemBuilder: (context, i) {
                              return CardsDetail(size, dataList[i]);
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

              // Container(
              //   margin: EdgeInsets.only(top: size.height * 0.18),
              //   child: CardsDetail(size, "Sr.UX Engineer - Ember.js (Remote)",
              //       "United Kingdom"),
              // ),
              // CardsDetail(size, "Golang Developer (Remote)", "India"),
              // CardsDetail(
              // size, "Sr.Linux Engineer - Epp Product (Remote)", "Pakistan")
            ]),
          ),
          appBAR(size),
          searchBar(size),
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
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 2.h),
            child: IconButton(
              onPressed: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (_) => FormData(),
                //     ));
              },
              icon: Icon(
                Icons.menu,
                size: 4.h,
                color: Colors.white,
              ),
            ),
          ),
        ],
        title: Text("Octo Job Search"),
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
            child: Icon(
              Icons.search,
              color: Colors.white,
              size: 22.sp,
            ),
          ),
        ]),
      ),
    );
  }

  Widget CardsDetail(size,QueryDocumentSnapshot data) {
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
              "C",
              style: TextStyle(fontSize: 14.sp, color: Colors.white),
            ),
          )),
    ]);
  }
}
