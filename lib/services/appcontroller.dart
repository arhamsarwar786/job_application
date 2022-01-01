import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/model/app_user.dart';
import 'package:firebase_app/util/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppController {

  final firestoreInstance = FirebaseFirestore.instance;

  //SIGN UP
  Future signUpUser(String userName, bool isRec, String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      print(userCredential.user!.uid);
      AppUser newUser = new AppUser(
        userId: userCredential.user!.uid,
        email: email,
        userName: userName,
        isRec: isRec
      );
      dynamic resultUser = await newUser.signUpUser(newUser);
      if (resultUser != null) 
      {
        Map finalResponse = <dynamic, dynamic>{}; //empty map
        finalResponse['Status'] = "Success";
        finalResponse['User'] = resultUser;
        Constants.appUser = resultUser;
        await Constants.appUser.saveUserDetails();
        return finalResponse;
      } 
      else 
      {
        Map finalResponse = <dynamic, dynamic>{}; //empty map
        finalResponse['Error'] = "Error";
        finalResponse['ErrorMessage'] ="User cannot signup at this time. Try again later";
        return finalResponse;
      }
    } on FirebaseAuthException catch (e) {
      Map finalResponse = <dynamic, dynamic>{}; //empty map
      finalResponse['Status'] = "Error";
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        finalResponse['ErrorMessage'] = "No user found for that email";
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        finalResponse['ErrorMessage'] = "Wrong password provided for that user";
      }
      return finalResponse;
    } catch (e) {
      print(e.toString());
      return setUpFailure();
    }
  }

  //SIGN IN
  Future signInUser(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      print(userCredential.user!.uid);
       AppUser newUser = new AppUser(
        userId: userCredential.user!.uid,
        email: email,
        userName: '',
        password: password,
      );
      dynamic resultUser = await AppUser.getLoggedInUserDetail(newUser);
      if (resultUser != null)
      {
        Map finalResponse = <dynamic, dynamic>{}; //empty map
        finalResponse['Status'] = "Success";
        finalResponse['User'] = resultUser;
        Constants.appUser = resultUser;
        await Constants.appUser.saveUserDetails();
        return finalResponse;
      }
      else 
      {
        Map finalResponse = <dynamic, dynamic>{}; //empty map
        finalResponse['Error'] = "Error";
        finalResponse['ErrorMessage'] = "User cannot login at this time. Try again later";
        return finalResponse;
      }
    } on FirebaseAuthException catch (e) {
      Map finalResponse = <dynamic, dynamic>{}; //empty map
      finalResponse['Status'] = "Error";
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        finalResponse['ErrorMessage'] = "The password provided is too weak.";
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        finalResponse['ErrorMessage'] =
            "The account already exists for that email";
      } else {
        finalResponse['ErrorMessage'] = e.code;
      }
      return finalResponse;
    } catch (e) {
      print(e.toString());
      return setUpFailure();
    }
  }
  
  //FORGOT PASSWORD
  Future forgotPassword(String email) async {
    try {
      String result = "";
      await FirebaseAuth.instance
      .sendPasswordResetEmail(email: email).then((_) async {
        result = "Success";
      }).catchError((error) {
        result = error.toString();
        print("Failed emailed : $error");
      });

      if (result == "Success") {
        Map finalResponse = <dynamic, dynamic>{}; //empty map
        finalResponse['Status'] = "Success";
        return finalResponse;
      } else {
        Map finalResponse = <dynamic, dynamic>{}; //empty map
        finalResponse['Error'] = "Error";
        finalResponse['ErrorMessage'] = result;
        return finalResponse;
      }
    } on FirebaseAuthException catch (e) {
      Map finalResponse = <dynamic, dynamic>{}; //empty map
      finalResponse['Status'] = "Error";
      finalResponse['ErrorMessage'] = e.code;
      return finalResponse;
    } catch (e) {
      print(e.toString());
      return setUpFailure();
    }
  }

  Map setUpFailure() {
    Map finalResponse = <dynamic, dynamic>{}; //empty map
    finalResponse['Status'] = "Error";
    finalResponse['ErrorMessage'] = "Please try again later. Server is busy.";
    return finalResponse;
  }
}
