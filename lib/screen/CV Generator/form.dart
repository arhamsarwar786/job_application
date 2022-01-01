import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/screen/home_screen/jobscreen.dart';
import 'package:firebase_app/util/constants.dart';

import 'add_certificate.dart';
import 'add_edcuation.dart';
import 'add_experince.dart';
import 'add_project.dart';
import 'add_skills.dart';
import 'pdf_page.dart';
import 'package:flutter/material.dart';

class FormData extends StatefulWidget {
  final String companyID;
  FormData(this.companyID);

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

  @override
  final _formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              // key: _formKey,
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
                              children: const [
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                    "Welcome to Indeed for Employers!",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                            // Column(
                            //   mainAxisAlignment: MainAxisAlignment.start,
                            //   children: [
                            //     Container(
                            //       decoration: const BoxDecoration(
                            //           // color: Colors.amber,
                            //           image: DecorationImage(
                            //         image: AssetImage("Assets/employee.jpg"),
                            //       )),
                            //     ),
                            //   ],
                            // ),
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
                              "Create your CV",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
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
                            SizedBox(
                              height: 40,
                              width: MediaQuery.of(context).size.width / 1.1,
                              child: TextFormField(
                                controller: firstName,
                                cursorColor: Colors.black,
                                textAlign: TextAlign.left,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 1.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 1.0),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
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
                            SizedBox(
                              height: 40,
                              width: MediaQuery.of(context).size.width / 1.1,
                              child: TextField(
                                controller: designation,
                                keyboardType: TextInputType.name,
                                cursorColor: Colors.black,
                                textAlign: TextAlign.left,
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
                              "Residing ",
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
                              child: TextField(
                                controller: residing,
                                keyboardType: TextInputType.name,
                                cursorColor: Colors.black,
                                textAlign: TextAlign.left,
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
                              "Email",
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
                              child: TextField(
                                controller: email,
                                keyboardType: TextInputType.name,
                                cursorColor: Colors.black,
                                textAlign: TextAlign.left,
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
                              "Phone Number",
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
                              child: TextField(
                                controller: phoneno,
                                keyboardType: TextInputType.number,
                                cursorColor: Colors.black,
                                textAlign: TextAlign.left,
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
                              "LinkedIn account",
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
                              child: TextField(
                                controller: linkedin,
                                keyboardType: TextInputType.name,
                                cursorColor: Colors.black,
                                textAlign: TextAlign.left,
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
                                  // height: 180,
                                  width:
                                      MediaQuery.of(context).size.width / 1.4,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      for (int i = 0; i < addEdtion.length; i++)
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Container(
                                            // height: 30,
                                            width: 300,
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade300,
                                              border: Border.all(
                                                  color: Colors.grey.shade300,
                                                  width:
                                                      3.0), // Set border width
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(
                                                      10.0)), // Set rounded corner radius
                                            ),
                                            child: Center(
                                              child: Text(
                                                  " ${i + 1} -  ${addEdtion[i]['school']}      \t     ${addEdtion[i]['date']}"),
                                            ),
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
                                          child: Container(
                                            width: 300,
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade300,
                                              border: Border.all(
                                                  color: Colors.grey.shade300,
                                                  width:
                                                      3.0), // Set border width
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(
                                                      10.0)), // Set rounded corner radius
                                            ),
                                            child: Center(
                                              child: Text(
                                                  " ${i + 1} -  ${addcertificate[i]['name']}      \t     ${addcertificate[i]['date']}"),
                                            ),
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
                                          child: Container(
                                            width: 300,
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade300,
                                              border: Border.all(
                                                  color: Colors.grey.shade300,
                                                  width:
                                                      3.0), // Set border width
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(
                                                      10.0)), // Set rounded corner radius
                                            ),
                                            child: Center(
                                              child: Text(
                                                  " ${i + 1} -  ${addExperince[i]['campany']}      \t     ${addExperince[i]['job']} \n ${addExperince[i]['date']}"),
                                            ),
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
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Container(
                                            width: 300,
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade300,
                                              border: Border.all(
                                                  color: Colors.grey.shade300,
                                                  width:
                                                      3.0), // Set border width
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(
                                                      10.0)), // Set rounded corner radius
                                            ),
                                            child: Center(
                                              child: Text(
                                                  " ${i + 1} -  ${addProject[i]['name']}      \t     ${addProject[i]['lang']} \n ${addProject[i]['date']}"),
                                            ),
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
                                          child: Container(
                                            width: 300,
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade300,
                                              border: Border.all(
                                                  color: Colors.grey.shade300,
                                                  width:
                                                      3.0), // Set border width
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(
                                                      10.0)), // Set rounded corner radius
                                            ),
                                            child: Center(
                                              child: Text(
                                                  " ${i + 1} -  ${addskills[i]['lang']} "),
                                            ),
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
                            SizedBox(
                              height: 80,
                              width: MediaQuery.of(context).size.width / 1.1,
                              child: TextField(
                                maxLines: 3,
                                controller: personal,
                                keyboardType: TextInputType.name,
                                cursorColor: Colors.black,
                                textAlign: TextAlign.left,
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
                                    // if (_formKey.currentState!.validate()) {
                                    //   ScaffoldMessenger.of(context)
                                    //       .showSnackBar(
                                    //     const SnackBar(
                                    //         content: Text('Processing Data')),
                                    //   );
                                    // } else {
                                    //   ScaffoldMessenger.of(context)
                                    //       .showSnackBar(
                                    //     const SnackBar(
                                    //         content: Text('Invaild Data')),
                                    //   );
                                    // }
                                    // final pdfFile =
                                    //     await PdfApi.generateCenteredText({
                                    //   "firstName": firstName.text,
                                    //   "designation": designation.text,
                                    //   "residing": residing.text,
                                    //   "email": email.text,
                                    //   "phoneno": phoneno.text,
                                    //   "linkedin": linkedin.text,
                                    //   "edcution": addEdtion,
                                    //   "experience": addExperince,
                                    //   "project": addProject,
                                    //   "skills": addskills,
                                    //   "certicate": addcertificate,
                                    //   "personal": personal.text,
                                    // });
                                    // PdfApi.openFile(pdfFile);



                                    FirebaseFirestore.instance.collection("Companies").doc(widget.companyID).collection("ApplicationsRecevied").doc().set({
                                      "CandidateData":{ "firstName": firstName.text,
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
                                      "personal": personal.text,}
                                    });



                                      Navigator.push(context, MaterialPageRoute(builder: (_)=> SearchedList()));


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
}