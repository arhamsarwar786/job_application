// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/screen/Company%20Block/chat_message.dart';
import 'package:firebase_app/screen/Company%20Block/check_details_and_cv.dart';
import 'package:firebase_app/screen/home_screen/candidate_chat_message.dart';
import 'package:firebase_app/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class AppliedJobs extends StatefulWidget {  

  @override
  _AppliedJobsState createState() => _AppliedJobsState();
}

class _AppliedJobsState extends State<AppliedJobs> {
  
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon:  Icon(
          Icons.arrow_back_sharp,
          size: 20,
          color: Colors.white,  
        ),),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        title: const Text(
          "Applied Jobs",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
      // FirebaseFirestore.instance.collection("Companies").doc(widget.companyID).collection("ApplicationsRecevied")
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [   

                       Container(
                
                child: StreamBuilder(                
                    stream: FirebaseFirestore.instance.collection("users").doc(Constants.appUser.userId).collection("AppliedJobs").snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      // if (snapshot.data!.docs.isEmpty || snapshot.data == null)
                      // return  Center(child: CircularProgressIndicator());
                      if (snapshot.hasData && snapshot.data != null) {
                      QuerySnapshot data = snapshot.data as QuerySnapshot;
                      var dataList = data.docs;
                                         
                        return dataList.isEmpty ? Text("No Applied Jobs")  :  ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: dataList.isEmpty ? 0 : dataList.length,
                            itemBuilder: (context, i) {
                              return CardsDetail( dataList[i]);
                            });
                      }
                      // else if(snapshot.data!.docs.isEmpty){
                      //   return Center(child: Text("No Application Recevied!"),);
                      // }
                      // else if(snapshot.data!.docs.isEmpty){
                      //     return Center(child: Text("NO"),);
                      // }
                      return Container(
                        // height: size.height,
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }),
              ),
// ,...................................................///
            
          
                 
                  
                
              
            ],
          ),
        ),
      ),
    );
  }

CardsDetail(QueryDocumentSnapshot data){
    return   Container(
                width: double.infinity,
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>CheckDetails(data)));
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    color: Colors.white,
                    elevation: 10,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                         Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.grey,
                            radius: 25,
                            backgroundImage: NetworkImage("${data.get("CandidateImage")}"),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child:  Padding(
                                padding: EdgeInsets.fromLTRB(5, 8, 0, 0),
                                child: Text(
                                  data.get("CandidateData")["designation"],
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17,
                                      color: Colors.black54),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                                child: Text(
                                  '${data.get("CandidateData")["residing"]}',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: Colors.grey),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(20),
                              child: Center(
                                child: IconButton(onPressed: (){
                                  // print(data.get('CandidateData'));

                                  Navigator.push(context, MaterialPageRoute(builder: (_)=> CandidateChatMessages(data: data,recieverMail: data.get("CandidateData")['companyEmail'],),),);
                                }, icon: Icon(
                                  Icons.chat,
                                  size: 30,
                                  color: Colors.black45,
                                ),),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );


  }
}
