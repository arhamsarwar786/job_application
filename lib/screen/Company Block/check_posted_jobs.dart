import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/screen/Company%20Block/check_details_and_cv.dart';
import 'package:firebase_app/util/constants.dart';
import 'package:flutter/material.dart';

class CheckPostedJobs extends StatelessWidget {
  final data;
  CheckPostedJobs(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Posted Job Detail"),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  "Tilte: ",
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20, ),
                ),

                  Text(
                  " ${data.get('title')}",
                  style: TextStyle(),
                ),
              ],
            ),

               Row(
                 children: [
                   Text(
                      "Discription: ",
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20, ),
                    ),
                        Text(
                  " ${data.get('discription')}",
                  style: TextStyle(),
                ),
              
                 ],
               ),


                 Row(
                 children: [
                   Text(
                      "City ",
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20, ),
                    ),
                        Text(
                  " ${data.get('city')}",
                  style: TextStyle(),
                ),
              
                 ],
               ),

              
            
          ],
        ),
      ),
    );
  }
}
