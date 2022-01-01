import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/screen/CV%20Generator/form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class JobDetails extends StatelessWidget {
  final QueryDocumentSnapshot data;
  JobDetails(this.data);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          Column(children: [
            CardsDetail2(
              context,
                size,
                data.get("title"),
                "${data.get('city')}",
                '''
                ${data.get("discription")}
                 '''),
          ]),
          appBAR(size,context),
          CardsDetail(size, "AKTA", "http://www.akta.tech"),
        ],
      ),
    );
  }

  Widget appBAR(size,context) {
    return Container(
      height: size.height * 0.22,
      child: AppBar(
        titleTextStyle: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 4.h,
            color: Colors.white,
          ),
        ),
        title: Text(data.get("title")),
        backgroundColor: Colors.blue[900],
      ),
    );
  }

  Widget CardsDetail(size, nameDevloper, link) {
    return Stack(children: [
      Container(
        height: size.height * 0.28,
        margin: EdgeInsets.only(left: 2.h, right: 2.h, top: 15.h),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 6.h),
                child: Text(
                  nameDevloper,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                )),
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 2.h, bottom: 2.h),
                child: Text(
                  link,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.sp,
                  ),
                )),
            MaterialButton(
                onPressed: () {},
                color: Colors.blue[900],
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 4,
                child: Text(
                  "Visit",
                  style: TextStyle(
                    color: Colors.white,
                    // fontSize: 1.sp,
                    fontWeight: FontWeight.w900,
                  ),
                )),
          ],
        ),
      ),
      Positioned(
          top: size.height * 0.11,
          left: size.width / 2.6,
          child: Container(
            alignment: Alignment.center,
            height: size.height * 0.10,
            width: size.width * 0.22,
            decoration: BoxDecoration(
              color: Colors.red[900],
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              "A",
              style: TextStyle(
                  fontSize: 24.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w900),
            ),
          )),
    ]);
  }

  Widget CardsDetail2(context,size, nameDevloper, country, text) {
    return Container(
        height: size.height * 0.54,
        margin: EdgeInsets.only(left: 2.h, right: 2.h, top: 46.h),
        padding: EdgeInsets.only(top: 2.h),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 2.h),
                      child: Text(
                        "${DateFormat('yMMMMd').format(data.get('timestamp').toDate())}",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 10.sp,
                        ),
                      )),
                  Padding(
                      padding: EdgeInsets.only(right: 2.h),
                      child: Text(
                        "Full Time",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 10.sp,
                        ),
                      )),
                ],
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 2.h, top: 2.h),
                  child: Text(
                    nameDevloper,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w900,
                    ),
                  )),
              Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 2.h, top: 2.h, bottom: 2.5.h),
                  child: Text(
                    country,
                    style: TextStyle(
                   color: Colors.blue[900],
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold
                    ),
                  )),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.h),
                child: MaterialButton(
                    minWidth: size.width,
                    height: size.height * 0.05,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_)=> FormData(data.get("companyID")) ));
                      // print(data.get("companyID"));
                    },
                    color: Colors.blue[900],
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 4,
                    child: Text(
                      "Apply",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w900,
                      ),
                    )),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only( right: 3.h, left: 3.h, top: 3.h),
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 10.sp,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}