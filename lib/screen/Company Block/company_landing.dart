// ignore_for_file: file_names
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/model/app_user.dart';
import 'package:firebase_app/screen/Company%20Block/applications_list.dart';
import 'package:firebase_app/screen/Company%20Block/posted_jobs_list.dart';
import 'package:firebase_app/screen/Post%20Job/post_job.dart';
import 'package:firebase_app/screen/home_screen/jobscreen.dart';
import 'package:firebase_app/screen/selectdoman/SelectionJob.dart';
import 'package:firebase_app/screen/sign_in/sign_in.dart';
import 'package:firebase_app/util/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sizer/sizer.dart';

import 'check_details_and_cv.dart';

class CompanyLanding extends StatefulWidget {
  const CompanyLanding({Key? key}) : super(key: key);

  @override
  State<CompanyLanding> createState() => _CompanyLandingState();
}

class _CompanyLandingState extends State<CompanyLanding> {
  int applicationsLength = 0;

  var postedJobs = [];
  int postedJobsLength = 0;

  fetchPostedJobs() {
    FirebaseFirestore.instance
        .collection("Companies")
        .doc(Constants.appUser.userId)
        .collection("jobPosts")
        .snapshots()
        .listen((event) {
      event.docs.forEach((element) {
        postedJobs.add(element.data());
        // print(element.data());
      });
      postedJobsLength = event.docs.length;
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    fetchPostedJobs();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(    
      drawer: homeDrawer(context),
      backgroundColor: Colors.grey[200],
      body: CardsDetail2(size),
    );
  }

  Widget appBAR(size, context) {
    return Container(
      color: Colors.blue[900],
      height: size.height * 0.38,
      child: Column(
        children: [
          Container(
            child: AppBar(
              elevation: 0,
              centerTitle: true,
              titleTextStyle: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
              ),
              title: const Text(
                "Dashboard",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              backgroundColor: Colors.blue[900],
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => PostJob()));
                    },
                    icon: Icon(Icons.add))
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "${Constants.appUser.userName}",
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700),
          ),
          Text(
            "${Constants.appUser.email}",
            style: TextStyle(
                color: Colors.white, fontSize: 13, fontWeight: FontWeight.w200),
          ),
        ],
      ),
    );
  }

  Widget CardsDetail(size,applicationLength) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: size.height * 0.17,
            width: size.width * 0.42,
            margin: EdgeInsets.only(left: 2.h, right: 1.h, top: 23.h),
            decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(5.0)),
            child: InkWell(
                onTap:(){
              Navigator.push(context, MaterialPageRoute(builder: (_)=> ApplicationsList()));
            },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Total Application",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Text(
                          "$applicationLength",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                    ]),
              ),
            ),
          ),
          Container(
              height: size.height * 0.17,
              width: size.width * 0.42,
              margin: EdgeInsets.only(left: 2.h, right: 1.h, top: 23.h),
              decoration: BoxDecoration(
                  color: Colors.lightGreen,
                  borderRadius: BorderRadius.circular(5.0)),
              child: InkWell(
                    onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => PostedJobs()));
            },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Total Posted",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: Text(
                            "$postedJobsLength",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                      ]),
                ),
              )),
        ],
      ),
    );
  }

  Widget CardsDetail2(size) {
    return Container(
      child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("Companies")
              .doc(Constants.appUser.userId)
              .collection("ApplicationsRecevied")
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            QuerySnapshot data = snapshot.data as QuerySnapshot;
            var dataList = data.docs;
            if (snapshot.hasData && snapshot.data != null) {
              EasyLoading.dismiss();
              applicationsLength = dataList.length;
              return Stack(
                children: [
                  appBAR(size, context),
                  CardsDetail(size,applicationsLength),
                  Container(
                    height: size.height * 0.54,
                    margin: EdgeInsets.only(left: 2.h, right: 2.h, top: 45.h),
                    padding: EdgeInsets.only(top: 2.h),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0)),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(left: 2.h),
                                  child: Text(
                                    "New Updates",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12.sp,
                                    ),
                                  )),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => ApplicationsList()));
                                },
                                child: Padding(
                                    padding: EdgeInsets.only(right: 2.h),
                                    child: Text(
                                      "SEE ALL",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12.sp,
                                      ),
                                    )),
                              ),
                            ],
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: dataList.isEmpty ? 0 : dataList.length,
                              itemBuilder: (context, i) {
                                return AppplicationsFetch(context, dataList[i]);
                              }),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
            return Container(
              height: size.height,
              child: Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator()),
            );
          }),
    );
  }

  AppplicationsFetch(context, QueryDocumentSnapshot data) {
    return Container(
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
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(5, 8, 0, 0),
                      child: Text(
                        data.get("CandidateData")["firstName"],
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
                        '${data.get("CandidateData")["personal"]}',
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
                      child: Icon(
                        Icons.chat,
                        size: 30,
                        color: Colors.black45,
                      ),
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

  Widget homeDrawer(context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("${Constants.appUser.userName}"),
            accountEmail: Text("${Constants.appUser.email}"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Theme.of(context).platform == TargetPlatform.iOS
                  ? Colors.white
                  : Colors.white,
              child: Text(
                '${Constants.appUser.userName[0].toUpperCase()}',
                style:
                    TextStyle(fontSize: 40.0, color: Constants.appThemeColor),
              ),
            ),
            decoration: BoxDecoration(
              color: Constants.appThemeColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.account_circle,
              color: Constants.appThemeColor,
              size: 30.0,
            ),
            title: Text(
              'My Profile',
              style: TextStyle(
                color: Constants.appThemeColor,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.person_add_alt,
              color: Constants.appThemeColor,
              size: 30.0,
            ),
            title: Text(
              'All Applications',
              style: TextStyle(
                color: Constants.appThemeColor,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ApplicationsList()),
              );
            },
          ),
          // ListTile(
          //   leading: Icon(
          //     Icons.forum,
          //     color: Constants.appThemeColor,
          //     size: 30.0,
          //   ),
          //   title: Text(
          //     'Company Register',
          //     style: TextStyle(
          //       color: Constants.appThemeColor,
          //     ),
          //   ),
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => FormData()),
          //     );
          //   },
          // ),
          ListTile(
            leading: Icon(
              Icons.format_align_justify_rounded,
              color: Constants.appThemeColor,
              size: 30.0,
            ),
            title: Text(
              'Total Posted Jobs',
              style: TextStyle(
                color: Constants.appThemeColor,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PostedJobs()),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: Constants.appThemeColor,
              size: 30.0,
            ),
            title: Text(
              'Logout',
              style: TextStyle(
                color: Constants.appThemeColor,
              ),
            ),
            onTap: () async {
              await AppUser.deleteUserAndOtherPreferences();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => SignInScreen()),
                (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
