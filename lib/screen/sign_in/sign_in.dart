import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/screen/Company%20Block/company_landing.dart';
import 'package:firebase_app/screen/forgot_password/forgot_password.dart';
import 'package:firebase_app/screen/home_screen/home_screen.dart';
import 'package:firebase_app/screen/home_screen/jobscreen.dart';
import 'package:firebase_app/screen/sign_up/sign_up.dart';
import 'package:firebase_app/services/appcontroller.dart';
import 'package:firebase_app/util/constants.dart';
import 'package:firebase_app/util/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  
  @override
  void initState() {
    super.initState();
  }

  //LOGIN METHOD
  void signInPressed() async {
    if (email.text.isEmpty)
      showAlertDialog("Please enter email address");
    else if (password.text.isEmpty)
      showAlertDialog( "Please enter password");
    else {
      EasyLoading.show(status: 'Please wait', maskType: EasyLoadingMaskType.black,);
      dynamic result = await AppController().signInUser(email.text, password.text);
      EasyLoading.dismiss();     
      if (result['Status'] == "Success")
      {
        // var userGet = await FirebaseFirestore.instance.collection("users").doc(Constants.appUser.userId).get();
        // print(userGet.get("isRec"));
        if (Constants.appUser.isRec) {
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>CompanyLanding()), (Route<dynamic> route) => false);
        }else{
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>HomeScreen()), (Route<dynamic> route) => false);
        }
      }
      else 
      {
        showAlertDialog(result['ErrorMessage']);
      }
    }
  }

  void showAlertDialog(String message){
    showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Try Again'),
        content: Text(message),
        actions: <Widget>[
          new TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: new Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Constants.appThemeColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        brightness: Brightness.dark,
      ),
      body: SingleChildScrollView(
        child: Container(
          //height: SizeConfig.blockSizeVertical * 90,
          //color: Colors.red,
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

              Container(
                margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 5),
                child: Text(
                  'Please login to continue',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: SizeConfig.fontSize * 2.5,
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.only(left: 30, right: 30, top: SizeConfig.blockSizeVertical * 5),
                height: SizeConfig.blockSizeVertical * 8,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Center(
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      prefixIcon: Icon(Icons.email, color: Colors.grey,),
                      border: InputBorder.none
                    ),
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.only(left: 30, right: 30, top: SizeConfig.blockSizeVertical * 3),
                height: SizeConfig.blockSizeVertical * 8,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Center(
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    controller: password,
                    obscureText: true,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.lock, color: Colors.grey,),
                      border: InputBorder.none
                    ),
                  ),
                ),
              ),

              GestureDetector(
                child: Container(
                  margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2, left: 30, right: 30),
                  child: Text(
                    'Forgot Password ?',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: SizeConfig.fontSize * 2,
                    ),
                  ),
                ),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassword()),);
                },
              ),

              Container(
                height: SizeConfig.blockSizeVertical * 8,
                margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 4, left: 30, right: 30),
                child: RaisedButton(
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
                  color: Colors.white,
                  onPressed: (){
                    signInPressed();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        color: Constants.appThemeColor,
                        fontSize: SizeConfig.fontSize * 2.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              )
              
            ],
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        child: Container(
          height: 30,
          margin: EdgeInsets.only(bottom: 20),
          child: RichText(
            textAlign: TextAlign.center,
            text: new TextSpan(
              text: 'Dont have an account? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: SizeConfig.fontSize * 2.0,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: ' SignUp',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.fontSize * 2.0,
                  ),
                ),
              ],
            ),
          )
        ),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()),);
        },
      ),
    );
  }
}