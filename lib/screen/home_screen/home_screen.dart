import 'dart:io';

import 'package:firebase_app/model/app_user.dart';
import 'package:firebase_app/screen/home_screen/applied_jobs.dart';
import 'package:firebase_app/screen/home_screen/jobscreen.dart';
import 'package:firebase_app/screen/selectdoman/SelectionJob.dart';
import 'package:firebase_app/screen/sign_in/sign_in.dart';
import 'package:firebase_app/util/constants.dart';
import 'package:firebase_app/util/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var searchData = TextEditingController();

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              TextButton(
                onPressed: () {
                  if (Platform.isAndroid) {
                    SystemNavigator.pop();
                  } else if (Platform.isIOS) {
                    exit(0);
                  }
                },
                child: new Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var size = MediaQuery.of(context).size;    
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Constants.appThemeColor,
          // backgroundColor: Colors.,
          elevation: 0,
          title: Text('Home'),
          centerTitle: true,
          brightness: Brightness.dark,
        ),
        drawer: homeDrawer(),
        body: Container( 
          child: SingleChildScrollView(
            
            child: Container(
              height: size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.blue.withOpacity(0.2), BlendMode.srcOver),
                image: AssetImage("assets/bg.jpg"),
                fit: BoxFit.cover,
              )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      'Find Jobs',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 26.0.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 1.5.h),
                    child: Text(
                      'Anytime, anywhere.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0.sp,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 1.h, right: 1.h, top: 6.h),
                    child: TextField(
                      controller: searchData,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        prefixIconConstraints: BoxConstraints(
                          minWidth: 0,
                        ),
                        isDense: true,
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(right: 2.0.h),
                          child: Icon(
                            Icons.search_sharp,
                            color: Colors.white,
                            size: 30.0.sp,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 1.5,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 1.5),
                        ),
                        hintText: "Job title, skills or company",
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 10.0.sp,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 6.h),
                    child: MaterialButton(
                      height: size.height * 0.09,
                      minWidth: size.width,
                      shape: RoundedRectangleBorder(),
                      color: Colors.blue[900],
                      onPressed: () {


                        FocusScope.of(context).unfocus();
                        

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SearchedList(searchData.text)),
                        );
                      },
                      child: Text("Find Jobs",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.0.sp,
                              fontWeight: FontWeight.w500)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget homeDrawer() {
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
          // ListTile(
          //   leading: Icon(
          //     Icons.account_circle,
          //     color: Constants.appThemeColor,
          //     size: 30.0,
          //   ),
          //   title: Text(
          //     'My Profile',
          //     style: TextStyle(
          //       color: Constants.appThemeColor,
          //     ),
          //   ),
          //   onTap: () {},
          // ),
          ListTile(
            leading: Icon(
              Icons.format_align_justify_rounded,
              color: Constants.appThemeColor,
              size: 30.0,
            ),
            title: Text(
              'All Jobs',
              style: TextStyle(
                color: Constants.appThemeColor,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchedList()),
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
              Icons.list_alt_outlined,
              color: Constants.appThemeColor,
              size: 30.0,
            ),
            title: Text(
              'Applied Jobs',
              style: TextStyle(
                color: Constants.appThemeColor,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AppliedJobs()),
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
