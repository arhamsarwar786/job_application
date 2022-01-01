import 'package:firebase_app/services/appcontroller.dart';
import 'package:firebase_app/util/constants.dart';
import 'package:firebase_app/util/size_config.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  TextEditingController email = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  //LOGIN METHODS
  void submitPressed() async {
    if (email.text.isEmpty)
      showAlertDialog("Please enter email address");
    else 
    {
      dynamic result = await AppController().forgotPassword(email.text);
      if (result['Status'] == "Success") 
      {
        Navigator.of(context).pop();
        showAlertDialog("We have emailed you password reset email. Please use it to change your password.\nThanks");
      } 
      else {
        //Fail Cases Show String
        showAlertDialog(result['ErrorMessage'],);
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
        iconTheme: IconThemeData(
          color: Colors.white
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
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
                  'Forgot Password',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: SizeConfig.fontSize * 2.5,
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 1, left: 30, right: 30),
                child: Text(
                  'Please enter your email to receive password reset link',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: SizeConfig.fontSize * 2.0,
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
                height: SizeConfig.blockSizeVertical * 8,
                margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 4, left: 30, right: 30),
                child: RaisedButton(
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
                  color: Colors.white,
                  onPressed: (){
                    submitPressed();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'SUBMIT',
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
    );
  }
}