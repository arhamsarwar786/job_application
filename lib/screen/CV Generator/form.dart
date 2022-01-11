import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/screen/home_screen/jobscreen.dart';
import 'package:firebase_app/util/constants.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import 'add_certificate.dart';
import 'add_edcuation.dart';
import 'add_experince.dart';
import 'add_project.dart';
import 'add_skills.dart';
import 'package:flutter/material.dart';

class FormData extends StatefulWidget {
  final String companyID,companyEmail,companyUserName;
  FormData(this.companyID,this.companyEmail,this.companyUserName);

  @override
  _FormDataState createState() => _FormDataState();
}

class _FormDataState extends State<FormData> {
  TextEditingController firstName = TextEditingController();
  TextEditingController designation = TextEditingController();
  TextEditingController residing = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneno = TextEditingController();
  TextEditingController linkedin = TextEditingController();
  TextEditingController edcution = TextEditingController();
  TextEditingController experience = TextEditingController();
  TextEditingController project = TextEditingController();
  TextEditingController skills = TextEditingController();
  TextEditingController certicate = TextEditingController();
  TextEditingController personal = TextEditingController();
  List addEdtion = [];
  List addExperince = [];
  List addProject = [];
  List addskills = [];
  List addcertificate = [];

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: Container(
                      height: 70,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                    "Welcome to Devsinn for Employers!",
                                    style: GoogleFonts.josefinSans(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
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
                              "Create your CV",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 15,
                            ),

                            // Image Picker
                            Container(
                              alignment: Alignment.center,
                              child: Container(
                                height: 120.0,
                                width: 120.0,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.blue.shade900,
                                        width: 1.0),
                                    color: Colors.black38,
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image:
                                            FileImage(File("$imagePickedPath")),
                                        fit: BoxFit.cover)),
                                // child: imagePickedPath == null
                                //     ? CircularProgressIndicator(
                                //         color: Colors.red,
                                //       )
                                //     :
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: InkWell(
                                    onTap: () {
                                      showMyDialogue(context);
                                    },
                                    child: ImageIcon(
                                      AssetImage("assets/camera.png"),
                                      color: Colors.blue.shade900,
                                      size: 40.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            const Text(
                              "Your Name",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter First Name';
                                }
                                return null;
                              },
                              controller: firstName,
                              minLines: 1,
                              maxLines: 4,
                              keyboardType: TextInputType.name,
                              cursorColor: Colors.black,
                              textAlign: TextAlign.start,
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.all(8),
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

                            SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Designation ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter Designation';
                                }
                                return null;
                              },
                              controller: designation,
                              minLines: 1,
                              maxLines: 4,
                              keyboardType: TextInputType.text,
                              cursorColor: Colors.black,
                              textAlign: TextAlign.start,
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.all(8),
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
                            SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Residing ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter Residing';
                                }
                                return null;
                              },
                              controller: residing,
                              minLines: 1,
                              maxLines: 4,
                              keyboardType: TextInputType.text,
                              cursorColor: Colors.black,
                              textAlign: TextAlign.start,
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.all(8),
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
                            SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Email",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter Email';
                                }
                                return null;
                              },
                              controller: email,
                              minLines: 1,
                              maxLines: 4,
                              keyboardType: TextInputType.emailAddress,
                              cursorColor: Colors.black,
                              textAlign: TextAlign.start,
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.all(8),
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
                            SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Phone Number",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter Phone Number';
                                }
                                return null;
                              },
                              controller: phoneno,
                              minLines: 1,
                              maxLines: 4,
                              keyboardType: TextInputType.phone,
                              cursorColor: Colors.black,
                              textAlign: TextAlign.start,
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.all(8),
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
                            SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "LinkedIn account",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter LinkedIn Address';
                                }
                                return null;
                              },
                              controller: linkedin,
                              minLines: 1,
                              maxLines: 4,
                              keyboardType: TextInputType.text,
                              cursorColor: Colors.black,
                              textAlign: TextAlign.start,
                              decoration: InputDecoration(
                                hintText: "https://",
                                isDense: true,
                                contentPadding: EdgeInsets.all(8),
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
                            SizedBox(
                              height: 15,
                            ),
                            const Text(
                              "Add Edcuation",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1.4,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      for (int i = 0; i < addEdtion.length; i++)
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                // decoration: BoxDecoration(
                                                //   color: Colors.grey.shade300,
                                                //   border: Border.all(
                                                //       color: Colors.grey.shade300,
                                                //       width:
                                                //           3.0), // Set border width
                                                //   borderRadius: BorderRadius.all(
                                                //       Radius.circular(
                                                //           10.0)), // Set rounded corner radius
                                                // ),
                                                child: Center(
                                                  child: Text(" ${i + 1} -"),
                                                ),
                                              ),
                                              Container(
                                                width: 150,
                                                decoration: BoxDecoration(
                                                  color: Colors.grey.shade300,
                                                  border: Border.all(
                                                      color:
                                                          Colors.grey.shade300,
                                                      width:
                                                          3.0), // Set border width
                                                  borderRadius: BorderRadius
                                                      .all(Radius.circular(
                                                          10.0)), // Set rounded corner radius
                                                ),
                                                child: Center(
                                                  child: Text(
                                                      "${addEdtion[i]['school']}      ${addEdtion[i]['date']}"),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                    ],
                                  ),
                                  // child: TextField(
                                  //   controller: edcution,
                                  //   maxLines: 10,
                                  //   keyboardType: TextInputType.name,
                                  //   cursorColor: Colors.black,
                                  //   textAlign: TextAlign.left,
                                  //   decoration: InputDecoration(
                                  //     enabledBorder: OutlineInputBorder(
                                  //       borderSide: BorderSide(
                                  //           color: Colors.grey, width: 1.0),
                                  //     ),
                                  //     focusedBorder: OutlineInputBorder(
                                  //       borderSide: BorderSide(
                                  //           color: Colors.black, width: 1.0),
                                  //     ),
                                  //     // hintText: "Enter Phone Number",
                                  //   ),
                                  // ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                      color: Colors.blue[900],
                                      shape: BoxShape.circle),
                                  child: IconButton(
                                      onPressed: () async {
                                        addEdtion = await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AddEducation(addEdtion)),
                                        );
                                        setState(() {});
                                      },
                                      icon: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 20,
                                      )),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Add Certificate",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  // height: 80,
                                  width:
                                      MediaQuery.of(context).size.width / 1.4,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      for (int i = 0;
                                          i < addcertificate.length;
                                          i++)
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Row(
                                            children: [
                                              Center(
                                                child: Text(" ${i + 1} - "),
                                              ),
                                              Container(
                                                width: 150,
                                                decoration: BoxDecoration(
                                                  color: Colors.grey.shade300,
                                                  border: Border.all(
                                                      color:
                                                          Colors.grey.shade300,
                                                      width:
                                                          3.0), // Set border width
                                                  borderRadius: BorderRadius
                                                      .all(Radius.circular(
                                                          10.0)), // Set rounded corner radius
                                                ),
                                                child: Center(
                                                  child: Text(
                                                      "${addcertificate[i]['name']}      ${addcertificate[i]['date']}"),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                //   height: 80,
                                //   width:
                                //       MediaQuery.of(context).size.width / 1.4,
                                //   child: TextField(
                                //     controller: certicate,
                                //     maxLines: 2,
                                //     keyboardType: TextInputType.name,
                                //     cursorColor: Colors.black,
                                //     textAlign: TextAlign.left,
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
                                  width: 10,
                                ),
                                Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                      color: Colors.blue[900],
                                      shape: BoxShape.circle),
                                  child: IconButton(
                                      onPressed: () async {
                                        addcertificate = await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AddCertificate(
                                                      addcertificate)),
                                        );
                                        setState(() {
                                          
                                        });
                                      },
                                      icon: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 20,
                                      )),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Add Experience",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  // height: 80,
                                  width:
                                      MediaQuery.of(context).size.width / 1.4,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      for (int i = 0;
                                          i < addExperince.length;
                                          i++)
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Row(
                                            children: [
                                              Center(
                                                child: Text(" ${i + 1} -"),
                                              ),
                                              Container(
                                                width: 130,
                                                decoration: BoxDecoration(
                                                  color: Colors.grey.shade300,
                                                  border: Border.all(
                                                      color:
                                                          Colors.grey.shade300,
                                                      width:
                                                          3.0), // Set border width
                                                  borderRadius: BorderRadius
                                                      .all(Radius.circular(
                                                          10.0)), // Set rounded corner radius
                                                ),
                                                child: Center(
                                                  child: Text(
                                                      "${addExperince[i]['campany']}   ${addExperince[i]['job']} \n ${addExperince[i]['date']}"),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                // SizedBox(
                                //   height: 90,
                                //   width:
                                //       MediaQuery.of(context).size.width / 1.4,
                                //   child: TextField(
                                //     controller: experience,
                                //     maxLines: 10,
                                //     keyboardType: TextInputType.name,
                                //     cursorColor: Colors.black,
                                //     textAlign: TextAlign.left,
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
                                  width: 10,
                                ),
                                Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                      color: Colors.blue[900],
                                      shape: BoxShape.circle),
                                  child: IconButton(
                                      onPressed: () async {
                                        addExperince = await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AddExperience(addExperince)),
                                        );
                                        setState(() {
                                          
                                        });
                                      },
                                      icon: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 20,
                                      )),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Add Project",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  // height: 80,
                                  width:
                                      MediaQuery.of(context).size.width / 1.4,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      for (int i = 0;
                                          i < addProject.length;
                                          i++)
                                        Row(
                                          children: [
                                            Center(
                                              child: Text(" ${i + 1} -"),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Container(
                                                width: 160,
                                                decoration: BoxDecoration(
                                                  color: Colors.grey.shade300,
                                                  border: Border.all(
                                                      color:
                                                          Colors.grey.shade300,
                                                      width:
                                                          3.0), // Set border width
                                                  borderRadius: BorderRadius
                                                      .all(Radius.circular(
                                                          10.0)), // Set rounded corner radius
                                                ),
                                                child: Center(
                                                  child: Text(
                                                      "${addProject[i]['name']}   ${addProject[i]['lang']} \n ${addProject[i]['date']}"),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                    ],
                                  ),
                                ),
                                // SizedBox(
                                //   height: 100,
                                //   width:
                                //       MediaQuery.of(context).size.width / 1.4,
                                //   child: TextField(
                                //     maxLines: 12,
                                //     controller: project,
                                //     keyboardType: TextInputType.name,
                                //     cursorColor: Colors.black,
                                //     textAlign: TextAlign.left,
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
                                  width: 10,
                                ),
                                Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                      color: Colors.blue[900],
                                      shape: BoxShape.circle),
                                  child: IconButton(
                                      onPressed: () async {
                                        addProject = await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AddProject(addProject)),
                                        );
                                        setState(() {
                                          
                                        });
                                      },
                                      icon: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 20,
                                      )),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Add Skills",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  // height: 80,
                                  width:
                                      MediaQuery.of(context).size.width / 1.4,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      for (int i = 0; i < addskills.length; i++)
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Row(
                                            children: [
                                              Center(
                                                child: Text(" ${i + 1} - "),
                                              ),
                                              Container(
                                                width: 160,
                                                decoration: BoxDecoration(
                                                  color: Colors.grey.shade300,
                                                  border: Border.all(
                                                      color:
                                                          Colors.grey.shade300,
                                                      width:
                                                          3.0), // Set border width
                                                  borderRadius: BorderRadius
                                                      .all(Radius.circular(
                                                          10.0)), // Set rounded corner radius
                                                ),
                                                child: Center(
                                                  child: Text(
                                                      "${addskills[i]['lang']} "),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                // SizedBox(
                                //   height: 100,
                                //   width:
                                //       MediaQuery.of(context).size.width / 1.4,
                                //   child: TextField(
                                //     controller: skills,
                                //     maxLines: 10,
                                //     maxLength: 100,
                                //     keyboardType: TextInputType.name,
                                //     cursorColor: Colors.black,
                                //     textAlign: TextAlign.left,
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
                                  width: 10,
                                ),
                                Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                      color: Colors.blue[900],
                                      shape: BoxShape.circle),
                                  child: IconButton(
                                      onPressed: () async {
                                        addskills = await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AddSkills(addskills)),
                                        );
                                        setState(() {
                                          
                                        });
                                      },
                                      icon: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 20,
                                      )),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Add Personal profile",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter Personal Info.';
                                }
                                return null;
                              },
                              controller: personal,
                              minLines: 3,
                              maxLines: 6,
                              keyboardType: TextInputType.text,
                              cursorColor: Colors.black,
                              textAlign: TextAlign.start,
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.all(8),
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
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      if (addEdtion.isEmpty) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                content:
                                                    Text('Add Education')));
                                      } else if (addcertificate.isEmpty) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                content:
                                                    Text('Add Certificate')));
                                      } else if (addExperince.isEmpty) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                content:
                                                    Text('Add Experience')));
                                      } else if (addProject.isEmpty) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                content: Text('Add Project')));
                                      } else if (addskills.isEmpty) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                content: Text('Add Skills')));
                                      } else {
                                        if (addskills.isNotEmpty &&
                                            addProject.isNotEmpty &&
                                            addExperince.isNotEmpty &&
                                            addcertificate.isNotEmpty &&
                                            addEdtion.isNotEmpty) {
                                              if(imagePickedPath != null){

                                          uploadImageFireStorage(
                                              imagePickedPath);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                                content: Text('Sending CV! Please Wait.....')),
                                          );
                                              }
                                              else{
                                                 ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                                content: Text('Add Image')),
                                          );
                                              }
                                        }
                                      }
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text('Something Missing!')),
                                      );
                                    }
                                  },
                                  color: Colors.blue[900],
                                  padding:
                                      const EdgeInsets.fromLTRB(9, 9, 9, 9),
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
      ),
    );
  }

  ///  Upload An IMage
  showMyDialogue(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: ListView(
              shrinkWrap: true,
              children: [
                SimpleDialogOption(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text('Camera'),
                    ),
                    onPressed: () {
                      selectOrTakePhoto(
                        context: context,
                        imageSource: ImageSource.camera,
                      );
                    }),
                Divider(
                  height: 5,
                ),
                SimpleDialogOption(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text('Gallery'),
                    ),
                    onPressed: () {
                      selectOrTakePhoto(
                        context: context,
                        imageSource: ImageSource.gallery,
                      );
                    }),
              ],
            ),
          );
        });
  }

  dynamic imagePickedPath;
  final picker = ImagePicker();

  /// Method for sending a selected or taken photo to the DialogBox
  Future selectOrTakePhoto({
    @required context,
    @required imageSource,
  }) async {
    picker.pickImage(source: imageSource, imageQuality: 10).then((value) async {
      // isImageUploaded = true;

      imagePickedPath = value!.path;

      setState(() {});
      print(value.path);
      Navigator.pop(context);
      // print("value Path = ${value.path}");
      // if (value != null)
      // _image = File(value.path);
      // else {
      //   isImageUploaded = false;
      //   setState(() {});
      // }
      // print("Picture Path = $_image");
      // if (_image != null) {
      //   // _progressDialog.showProgressDialog(context);
      //   String imageName =
      //       "AirHomeRestaurantUser_${GlobalState.userId}_Image.jpg";
      //

      //   if (snapshot.state == TaskState.success) {
      //     // _progressDialog.dismissProgressDialog(context);
      //     downloadUrl = await snapshot.ref.getDownloadURL();
      //     snapshot.ref.getMetadata().then((value) =>
      //         print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& ${value.fullPath}"));
      //     isImageUploaded = false;
      //     setState(() {});
      //     log('%%%%%%%%%%%%%%%%%%%%%%%%%%%%% URL = $downloadUrl');
      //     if (downloadUrl != null) {
      //       log('%%%%%%%%%%%%%%%%%%%%%%%%%%%% downloadUrl = $downloadUrl');
      //       // _progressDialog.dismissProgressDialog(context);

      //     } else {
      //       // _progressDialog.dismissProgressDialog(context);

      //       // _notification.error(
      //       // message: 'غير قادر على تحميل الصورة المصغرة', context: context);
      //       Navigator.pop(context);
      //     }
      // _progressDialog.dismissProgressDialog(context);

      // } else {
      //   // _progressDialog.dismissProgressDialog(context);
      //   Navigator.pop(context);
      //   print('Error from image repo ${snapshot.state.toString()}');
      //   throw ('This file is not an image');
      // }
      // }
    });
  }

  var downloadUrl = "";

  uploadImageFireStorage(image) async {
    var storage = FirebaseStorage.instance;
    // print(image);
    TaskSnapshot snapshot = await storage
        .ref()
        .child("${Constants.appUser.userId + Constants.appUser.userName}")
        .putFile(File(image));

    if (snapshot.state == TaskState.success) {
      downloadUrl = await snapshot.ref.getDownloadURL();


        Random random = new Random();
int ran1 = random.nextInt(100000);
int ran2 = random.nextInt(100000);

      FirebaseFirestore.instance
          .collection("Companies")
          .doc(widget.companyID)
          .collection("ApplicationsRecevied")
          .doc(widget.companyID+ran1.toString()+ran2.toString())
          .set({
        "CandidateData": {
          "firstName": firstName.text,
          "designation": designation.text,
          "residing": residing.text,  
          "email": email.text,
          "phoneno": phoneno.text,
          "linkedin": linkedin.text,
          "edcution": addEdtion,
          "experience": addExperince,
          "project": addProject,
          "skills": addskills,
          "certicate": addcertificate,
          "personal": personal.text,
          "companyEmail":widget.companyEmail,
          "companyID":widget.companyID,
          "companyUserName":widget.companyUserName,
          "emailAccount":Constants.appUser.email,
        },
        "CandidateImage": "$downloadUrl"
      });

      FirebaseFirestore.instance
          .collection("users")
          .doc(Constants.appUser.userId)
          .collection("AppliedJobs")
          .doc(widget.companyID+ran1.toString()+ran2.toString())
          .set({
        "CandidateData": {
          "firstName": firstName.text,
          "designation": designation.text,
          "residing": residing.text,
          "email": email.text,
          "phoneno": phoneno.text,
          "linkedin": linkedin.text,
          "edcution": addEdtion,
          "experience": addExperince,
          "project": addProject,
          "skills": addskills, 
          "certicate": addcertificate,
          "personal": personal.text,
          "companyEmail":widget.companyEmail,
          "companyID":widget.companyID,
          "companyUserName":widget.companyUserName,
          "emailAccount":Constants.appUser.email,
        },
        "CandidateImage": "$downloadUrl"
      });

      Navigator.push(
          context, MaterialPageRoute(builder: (_) => SearchedList()));
    }
  }
}
