import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/screen/home_screen/jobscreen.dart';
import 'package:firebase_app/services/appcontroller.dart';
import 'package:firebase_app/util/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class PostJob extends StatefulWidget {
  const PostJob({Key? key}) : super(key: key);

  @override
  _PostJobState createState() => _PostJobState();
}

class _PostJobState extends State<PostJob> {
  // Constroller

  var title = TextEditingController();
  var disc = TextEditingController();
  var city = TextEditingController();

  postJob() async {
    EasyLoading.show(
      status: 'Please wait',
      maskType: EasyLoadingMaskType.black,
    );

    // FirebaseFirestore.instance.collection("Companies").doc(Constants.appUser.userId).collection("jobPosts").doc().set({"title":title.text,"discription":disc.text,"timestamp": DateTime.now(),});
    FirebaseFirestore.instance.collection("AllJOBS").doc().set({
      "title": title.text,
      "discription": disc.text,
      "timestamp": DateTime.now(),
      "city": city.text,
      "companyID": Constants.appUser.userId
    });

        FirebaseFirestore.instance.collection("Companies").doc(Constants.appUser.userId).collection("jobPosts").doc().set({
      "title": title.text,
      "discription": disc.text,
      "timestamp": DateTime.now(),
      "city": city.text,
      "companyID": Constants.appUser.userId
    });

    EasyLoading.dismiss();
    Navigator.push(context, MaterialPageRoute(builder: (_) => SearchedList()));
    // print("$ids");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => SearchedList()));
        },
      ),
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
                                  "Welcome to JOBS for \nEmployers!",
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
                            "POST NEW JOB",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "Title",
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
                              controller: title,
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
                            "Discribtion",
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
                              controller: disc,
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
                            height: 15,
                          ),
                          const Text(
                            "City",
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
                              controller: city,
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
                            height: 10,
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
                                  postJob();
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
