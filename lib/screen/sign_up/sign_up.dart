import 'package:firebase_app/screen/Company%20Block/company_landing.dart';
import 'package:firebase_app/screen/home_screen/home_screen.dart';
import 'package:firebase_app/screen/home_screen/jobscreen.dart';
import 'package:firebase_app/services/appcontroller.dart';
import 'package:firebase_app/util/constants.dart';
import 'package:firebase_app/util/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isUser = true;

  @override
  void initState() {
    super.initState();
  }

  //LOGIN METHOD
  void signUpPressed() async {
    if (email.text.isEmpty)
     showAlertDialog("Please enter your name");
    else if (email.text.isEmpty)
     showAlertDialog("Please enter email address");
    else if (password.text.isEmpty)
      showAlertDialog( "Please enter password");
    else {
      EasyLoading.show(status: 'Please wait', maskType: EasyLoadingMaskType.black,);
      dynamic result= await AppController().signUpUser(userName.text, isUser , email.text, password.text);
      EasyLoading.dismiss();     
      if (result['Status'] == "Success")
      {
        print(result['Status']);
        
          if (Constants.appUser.isRec) {
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>CompanyLanding()), (Route<dynamic> route) => false);
        }else{
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>HomeScreen()), (Route<dynamic> route) => false);
        }
      }
      else 
      {
        //Fail Cases Show String
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
        brightness: Brightness.dark,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.white
        ),
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
                  'Fill the form to Signup',
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
                    controller: userName,
                    decoration: InputDecoration(
                      hintText: 'Username',
                      prefixIcon: Icon(Icons.account_circle, color: Colors.grey,),
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
                    decoration: InputDecoration(
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.lock, color: Colors.grey,),
                      border: InputBorder.none
                    ),
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.only(left: 30, right: 30, top: SizeConfig.blockSizeVertical * 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Text(
                        'Type : ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: SizeConfig.fontSize * 2.0,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 30),
                      child: Row(
                        children: [
                          SizedBox(
                          height: 30,
                          width: 30,
                          child: Checkbox(
                            focusColor: Colors.white,
                            value: isUser,
                            onChanged: (val){
                              setState(() {
                                isUser = val!;                                
                              });
                            },
                          ),
                        ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              'REC',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: SizeConfig.fontSize * 2.0,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                     Row(
                      children: [
                        SizedBox(
                          height: 30,
                          width: 30,
                          child: Checkbox(
                            value: !isUser,
                            onChanged: (val){
                              setState(() {
                                isUser = !val!;                                
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            'CAN',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: SizeConfig.fontSize * 2.0,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),

              

              Container(
                height: SizeConfig.blockSizeVertical * 8,
                margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 4, left: 30, right: 30),
                child: RaisedButton(
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
                  color: Colors.white,
                  onPressed: (){
                    signUpPressed();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'SIGNUP',
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