import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/screen/Company%20Block/check_details_and_cv.dart';
import 'package:firebase_app/screen/Company%20Block/posted_jobs_list.dart';
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

  getStatus() async {
    status = await FirebaseFirestore.instance
        .collection("Companies")
        .doc(Constants.appUser.userId)
        .collection("jobPosts").doc(widget.data.id)
        .get();
        status = status.get('status');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
    
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Posted Job Detail"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  // color: Colors.red,
                  width: size.width*0.30,
                  child: Text(
                    "Tilte: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  color: status == 'active' ?Colors.blue[100] :  Colors.orange[100],
                  width: size.width*0.60-4.0,
                  padding: EdgeInsets.all(5),
                  child: Text(
                    " ${widget.data.get('title')}",
                    style: TextStyle(),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: size.width*0.30,
                  child: Text(
                    "Discription: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  color: status == 'active' ?Colors.blue[100] :  Colors.orange[100],
                  width: size.width*0.60-4.0,padding: EdgeInsets.all(5),
                  child: Text(
                    " ${widget.data.get('discription')}",
                    style: TextStyle(),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: size.width*0.30,
                  child: Text(
                    "City ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  color: status == 'active' ?Colors.blue[100] :  Colors.orange[100],
                  width: size.width*0.60-4.0,padding: EdgeInsets.all(5),
                  child: Text(
                    " ${widget.data.get('city')}",
                    style: TextStyle(),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            MaterialButton(
              color: Colors.blue[900],
              onPressed: () {
                FirebaseFirestore.instance
                    .collection("Companies")
                    .doc(Constants.appUser.userId)
                    .collection("jobPosts")
                    .doc(widget.data.id)
                    .update({"status": "active"});

                FirebaseFirestore.instance
                    .collection("Companies")
                    .doc(Constants.appUser.userId)
                    .collection("pausedJobs")
                    .doc(widget.data.id)
                    .delete();

                FirebaseFirestore.instance
                    .collection("AllJOBS")
                    .doc(widget.data.id)
                    .set(widget.data.data());

                getStatus();
                //  print(status.get("status"));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Active",
                    style: TextStyle(color: Colors.white),
                  ),
                status == 'active' ?  Container(
                    margin: EdgeInsets.only(left: 10),
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.green[400]),
                  ) : Container()
                ],
              ),
            ),
            MaterialButton(
              color: Colors.yellow[900],
              onPressed: () {
                FirebaseFirestore.instance
                    .collection("Companies")
                    .doc(Constants.appUser.userId)
                    .collection("jobPosts")
                    .doc(widget.data.id)
                    .update({"status": "pause"});

                FirebaseFirestore.instance
                    .collection("Companies")
                    .doc(Constants.appUser.userId)
                    .collection("pausedJobs")
                    .doc(widget.data.id)
                    .set(widget.data.data());

                FirebaseFirestore.instance
                    .collection("AllJOBS")
                    .doc(widget.data.id)
                    .delete();
                //  FirebaseFirestore.instance.collection("Companies").doc(Constants.appUser.userId).update({
                //   "status":"pause",
                // });

                getStatus();
                // print(status.get("status"));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Pause",
                    style: TextStyle(color: Colors.white),
                  ),
                 status == 'pause' ?    Container(
                    margin: EdgeInsets.only(left: 10),
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.green[400]),
                  ) : Container()
                ],
              ),
            ),
            MaterialButton(
              color: Colors.red[900],
              onPressed: () {
                showAlertDialog(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Delete",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel",style: TextStyle(color: Colors.black),),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = MaterialButton(
      color: Colors.red,
      child: Text("Delete",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      onPressed: () {
        FirebaseFirestore.instance
            .collection("Companies")
            .doc(Constants.appUser.userId)
            .collection("jobPosts")
            .doc(widget.data.id)
            .delete();

        FirebaseFirestore.instance
            .collection("AllJOBS")
            .doc(widget.data.id)
            .delete();

        if (widget.data.get('status') == 'pause') {
          FirebaseFirestore.instance
              .collection("Companies")
              .doc(Constants.appUser.userId)
              .collection("pausedJobs")
              .doc(widget.data.id)
              .delete();
        }
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => PostedJobs()));
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Delete Posted Job?",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
      content: Text(
          "Are you really want to Delete Posted Job it will not Recover Again!"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
