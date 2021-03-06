// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/screen/Company%20Block/check_details_and_cv.dart';
import 'package:firebase_app/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'check_posted_jobs.dart';
import 'company_landing.dart';

class PostedJobs extends StatefulWidget {
  @override
  _PostedJobsState createState() => _PostedJobsState();
}

class _PostedJobsState extends State<PostedJobs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => CompanyLanding()),
                (Route<dynamic> route) => true);
          },
          icon: Icon(
            Icons.arrow_back_sharp,
            size: 20,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        title: const Text(
          "Posted JOBS",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
      // FirebaseFirestore.instance.collection("Companies").doc(widget.companyID).collection("ApplicationsRecevied")
      body: Container(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("Companies")
                .doc(Constants.appUser.userId)
                .collection("jobPosts")
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                QuerySnapshot data = snapshot.data as QuerySnapshot;
                var dataList = data.docs;
                // EasyLoading.dismiss();
                return dataList.isEmpty
                    ? Center(child: Text("No Posted Job"))
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: dataList.isEmpty ? 0 : dataList.length,
                        itemBuilder: (context, i) {
                          return CardsDetail(dataList[i]);
                        });
              }

              return Container(
                // height: size.height,
                child: Align(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator()),
              );
            }),
      ),
    );
  }

  CardsDetail(QueryDocumentSnapshot data) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => CheckPostedJobs(data)));
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
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.80,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 8, 0, 0),
                      child: Text(
                        data.get("title"),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
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
                    width: MediaQuery.of(context).size.width * 0.80,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 8),
                      child: Text(
                        '${data.get("discription")}',
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
              data.get("status") == "active"
                  ? Container(
                      margin: EdgeInsets.all(10),
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.green[400]),
                    )
                  : Container(
                      margin: EdgeInsets.all(10),
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.orange),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
