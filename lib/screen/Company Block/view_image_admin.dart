import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/screen/home_screen/candidate_chat_message.dart';
import 'package:firebase_app/util/constants.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'chat_message.dart';

class ViewImageAdmin extends StatelessWidget {
  final image, data,emailUser;
  ViewImageAdmin(this.image, this.data,this.emailUser);


  Future sndPictureFireStorage(context) async {
    if (image != null) {
      Random random = new Random();
      int ran1 = random.nextInt(100000);
      int ran2 = random.nextInt(100000);
      TaskSnapshot reference =await FirebaseStorage.instance.ref().child(
          "chat${Constants.appUser.userId + ran1.toString() + ran2.toString()}").putFile(File(image.path));
      // UploadTask uploadTask = reference.putFile(File(selectedImage));

      if (reference.state == TaskState.success) {
          var downloadUrl = await reference.ref.getDownloadURL();
          savingImage(context,downloadUrl);
          print(downloadUrl);
      }
    }
  }

  savingImage(context,downloadUrl) {
    try {
      if (downloadUrl != null) {
        FirebaseFirestore.instance
            .collection("Companies")
            .doc(data.get("CandidateData")['companyID'])
            .collection("ApplicationsRecevied")
            .doc(data.id)
            .collection("chat")
            .add({
          'message': "",
          'image_path': downloadUrl,
          'email': emailUser,
          'time': DateTime.now(),
        });

          Navigator.push(context, MaterialPageRoute(builder: (_)=> ChatMessages(data: data,recieverMail: data.get("CandidateData")['emailAccount'],) ));

      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            sndPictureFireStorage(context);
            print(data);
            // sendingImage();
          },
          child: Icon(Icons.send),
          backgroundColor: Colors.blue.shade900,
        ),
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.file(
                File(image.path),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
                top: 0,
                left: 0,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 30,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
