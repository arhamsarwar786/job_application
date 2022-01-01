// ignore_for_file: file_names

import 'package:firebase_app/screen/companyregister/AddCompany.dart';
import 'package:flutter/material.dart';

class SelectionJob extends StatefulWidget {
  const SelectionJob({Key? key}) : super(key: key);

  @override
  _SelectionJobState createState() => _SelectionJobState();
}

class _SelectionJobState extends State<SelectionJob> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 3,
                          width: MediaQuery.of(context).size.width * 0.9,
                          color: Colors.blue[900],
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.35,
                          width: MediaQuery.of(context).size.width * 0.8,
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                child: const Image(
                                    image: AssetImage("assets/jobone.jpg")),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                "Looking for a job?",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 50,
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: MaterialButton(
                                  child: const Text(
                                    "Find Jobs",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 19),
                                  ),
                                  onPressed: () {},
                                  color: Colors.blue[900],
                                  padding:
                                      const EdgeInsets.fromLTRB(9, 9, 9, 9),
                                  splashColor: Colors.grey,
                                  elevation: 4,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 3,
                          width: MediaQuery.of(context).size.width * 0.8,
                          color: Colors.blue[900],
                        ),
                        Container(
                            height: MediaQuery.of(context).size.height * 0.35,
                            width: MediaQuery.of(context).size.width * 0.8,
                            color: Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 80,
                                  width: 80,
                                  child: const Image(
                                      image: AssetImage("assets/jobone.jpg")),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  "Hiring an Employee?",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: 50,
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: MaterialButton(
                                    child: const Text(
                                      "Post a Jobs",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 19),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => AddCompany()),
                                      );
                                    },
                                    color: Colors.blue[900],
                                    padding:
                                        const EdgeInsets.fromLTRB(9, 9, 9, 9),
                                    splashColor: Colors.grey,
                                    elevation: 4,
                                  ),
                                ),
                              ],
                            ))
                      ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
