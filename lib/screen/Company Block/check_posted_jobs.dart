import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/screen/Company%20Block/check_details_and_cv.dart';
import 'package:firebase_app/util/constants.dart';
import 'package:flutter/material.dart';

class CheckPostedJobs extends StatefulWidget {
  final data;
  CheckPostedJobs(this.data);

  @override
  State<CheckPostedJobs> createState() => _CheckPostedJobsState();
}

class _CheckPostedJobsState extends State<CheckPostedJobs> {


  var status;

  @override
  void initState() {    
    super.initState();
    getStatus();
  }

  getStatus()async{
    status =await FirebaseFirestore.instance.collection("Companies").doc(Constants.appUser.userId).get();
    setState(() {      
    });
  }
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
                  " ${widget.data.get('title')}",
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
                  " ${widget.data.get('discription')}",
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
                  " ${widget.data.get('city')}",
                  style: TextStyle(),
                ),  
              
                 ],
               ),

               SizedBox(height: 50,),

              MaterialButton(
                color: Colors.blue[900],
                onPressed: (){
                  FirebaseFirestore.instance.collection("Companies").doc(Constants.appUser.userId).set({
                    "status":"active",
                  });

                 getStatus();
                //  print(status.get("status"));
                },child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Active",style:TextStyle(color: Colors.white),),
                  status.get("status") != "active" ? Container() :  Container(
                      margin: EdgeInsets.only(left: 10),
                      height: 10,width: 10,decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.green[400]),),
                  ],
                ),),

                 MaterialButton(
                color: Colors.yellow[900],
                onPressed: (){
                   FirebaseFirestore.instance.collection("Companies").doc(Constants.appUser.userId).update({
                    "status":"pause",
                  });

                  getStatus();
                  print(status.get("status"));
                },child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Pause",style:TextStyle(color: Colors.white),),
                    status.get("status") != "pause" ? Container() :  Container(
                      margin: EdgeInsets.only(left: 10),
                      height: 10,width: 10,decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.green[400]),)
                  ],
                ),),

                 MaterialButton(
                color: Colors.red[900],
                onPressed: (){},child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Delete",style:TextStyle(color: Colors.white),),                    
                  ],
                ),),
            
          ],
        ),
      ),
    );
  }
}
