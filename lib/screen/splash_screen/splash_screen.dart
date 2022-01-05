import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/model/app_user.dart';
import 'package:firebase_app/screen/Company%20Block/company_landing.dart';
import 'package:firebase_app/screen/Post%20Job/post_job.dart';
import 'package:firebase_app/screen/home_screen/home_screen.dart';
import 'package:firebase_app/screen/home_screen/jobscreen.dart';
import 'package:firebase_app/screen/sign_in/sign_in.dart';
import 'package:firebase_app/util/constants.dart';
import 'package:firebase_app/util/size_config.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      checkIfUserSaved();
    });
  }

  // fetchProfile()async{
  //    var userGet = await FirebaseFirestore.instance.collection("users").doc(Constants.appUser.userId).get();
  //    print(userGet.data());
  // }

  void checkIfUserSaved() async {
    Constants.appUser = await AppUser.getUserDetail();
    if(Constants.appUser.email.isNotEmpty)
    {
      Constants.appUser = await AppUser.getLoggedInUserDetail(Constants.appUser);       
        if (Constants.appUser.isRec) {
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>CompanyLanding()), (Route<dynamic> route) => false);
        }else{
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>HomeScreen()), (Route<dynamic> route) => false);
        }
    }
    else
    {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>SignInScreen()), (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Constants.appThemeColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: SizeConfig.blockSizeVertical * 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
              ),
              child: Image.asset('assets/logo.png'),
            ),
          ]
        ),
      )
    );
  }
}
