// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/services/appcontroller.dart';
import 'package:firebase_app/util/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class AddCompany extends StatefulWidget {
  const AddCompany({Key? key}) : super(key: key);

  @override
  _AddCompanyState createState() => _AddCompanyState();
}

class _AddCompanyState extends State<AddCompany> {


  // Constroller

  var name = TextEditingController();
  var companyName = TextEditingController();
  // var contact = TextEditingController();
  var email = TextEditingController();
  var phone = TextEditingController();
  var address = TextEditingController();


    addCompany()async{
      FirebaseFirestore.instance.collection("Companies").doc(Constants.appUser.userId).set({"name":name.text,"companyName":companyName.text,"email":email.text,"phone":phone.text,"address":address.text});
      print("Send");
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Text(
                                  "Welcome to Indeed for \nEmployers!",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 100,
                                width: 110,
                                color: Colors.red,
                                // decoration: const BoxDecoration(
                                //     // color: Colors.amber,
                                //     image: DecorationImage(
                                //   image: AssetImage("Assets/employee.jpg"),
                                // )),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                //  list form code
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 15, bottom: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Create your job posting account",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "Name",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            height: 40,
                            width: MediaQuery.of(context).size.width / 1.1,
                            child:  TextField(
                              controller: name,
                              cursorColor: Colors.black,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1.0),
                                ),
                                // hintText: "Enter Phone Number",
                              ),
                            ),
                          ),
                      
                          SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Company Name",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            height: 40,
                            width: MediaQuery.of(context).size.width / 1.1,
                            child:  TextField(
                              controller: companyName,
                              keyboardType: TextInputType.name,
                              cursorColor: Colors.black,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1.0),
                                ),
                                // hintText: "Enter Phone Number",
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Contact Email",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            height: 40,
                            width: MediaQuery.of(context).size.width / 1.1,
                            child:  TextField(
                              controller: email,
                              keyboardType: TextInputType.number,
                              cursorColor: Colors.black,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1.0),
                                ),
                                // hintText: "Enter Phone Number",
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Contact Phone",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            height: 40,
                            width: MediaQuery.of(context).size.width / 1.1,
                            child:  TextField(
                              controller: phone,
                              keyboardType: TextInputType.streetAddress,
                              cursorColor: Colors.black,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1.0),
                                ),
                                // hintText: "Enter Phone Number",
                              ),
                            ),
                          ),
                             SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Address",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            height: 40,
                            width: MediaQuery.of(context).size.width / 1.1,
                            child:  TextField(                              
                              controller: address,
                              keyboardType: TextInputType.streetAddress,
                              cursorColor: Colors.black,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1.0),
                                ),
                                // hintText: "Enter Phone Number",
                              ),
                            ),
                          ),
                          // const Text(
                          //   "Company Type",
                          //   style: TextStyle(
                          //       color: Colors.black,
                          //       fontSize: 15,
                          //       fontWeight: FontWeight.w400),
                          // ),
                          // SizedBox(
                          //   height: 5,
                          // ),
                          // SizedBox(
                          //   height: 40,
                          //   width: MediaQuery.of(context).size.width / 1.1,
                          //   child: const TextField(
                          //     cursorColor: Colors.black,
                          //     textAlign: TextAlign.center,
                          //     decoration: InputDecoration(
                          //       enabledBorder: OutlineInputBorder(
                          //         borderSide: BorderSide(
                          //             color: Colors.grey, width: 1.0),
                          //       ),
                          //       focusedBorder: OutlineInputBorder(
                          //         borderSide: BorderSide(
                          //             color: Colors.black, width: 1.0),
                          //       ),
                          //       // hintText: "Enter Phone Number",
                          //     ),
                          //   ),
                          // ),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 12.0, right: 12.0, top: 12.0),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width / 1.1,
                              child: MaterialButton(
                                child: const Text(
                                  "Submit",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                onPressed: () {
                                  addCompany();
                                },
                                color: Colors.blue[900],
                                padding: const EdgeInsets.fromLTRB(9, 9, 9, 9),
                                splashColor: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}