import 'package:firebase_app/model/app_user.dart';
import 'package:flutter/material.dart';

class Constants {
  static final Constants _singleton = new Constants._internal();
  static String appName = "Firebase Project";
  static Color appThemeColor = Colors.blue[900]!;
  static late AppUser appUser;
  
  factory Constants() {
    return _singleton;
  }

  Constants._internal();
}

