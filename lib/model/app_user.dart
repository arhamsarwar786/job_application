//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppUser {
  String userId = "";
  String userName = "";
  String email = "";
  String password = "";
  bool isRec;

  AppUser({this.userId = '', this.userName ='', this.email= '', this.password= '',  this.isRec = false});
  
  factory AppUser.fromJson(Map<String, dynamic> json) {
    AppUser user = new AppUser(
      userId: json['userID'],
      userName: json['userName'],
      email: json['email'],
      isRec: json["isRec"],
    );
    return user;
  }

  Future saveUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("UserId", this.userId);
    prefs.setString("UserName", this.userName);
    prefs.setString("UserEmail", this.email);
    prefs.setString("UserPassword", this.password);
    prefs.setBool("IsRec", this.isRec);
  }

  static Future<AppUser> getUserDetail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    AppUser user = new AppUser();
    user.userId = prefs.getString("UserId") ?? "";
    user.userName = prefs.getString("UserName") ?? "";
    user.email = prefs.getString("UserEmail") ?? "";
    user.password = prefs.getString("UserPassword") ?? "";
    user.isRec = prefs.getBool("IsRec") ?? false;
    return user;
  }

  static Future deleteUserAndOtherPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  ///*********FIRESTORE METHODS***********\\\\
  Future<dynamic> signUpUser(AppUser user) async {
    final firestoreInstance = FirebaseFirestore.instance;
    return await firestoreInstance.collection("users").doc(user.userId).set({
      'userID': user.userId,
      'userName': user.userName,
      'email': user.email,
      'isRec' : user.isRec,
    }).then((_) async {
      print("success!");
      //await user.saveUserDetails();
      return user;
    }).catchError((error) {
      print("Failed to add user: $error");
      return AppUser();
    });
  }

  static Future<dynamic> getLoggedInUserDetail(AppUser user) async {
    final firestoreInstance = FirebaseFirestore.instance;
    return await firestoreInstance
    .collection("users")
    .doc(user.userId)
    .get()
    .then((value) async {
      if(value.exists)
      {
        AppUser userTemp = AppUser.fromJson(value.data()!);
        userTemp.userId = user.userId;
        userTemp.password = user.password;
        return userTemp;
      }
    }).catchError((error) {
      print("Failed to add user: $error");
      return AppUser();
    });
  }

}