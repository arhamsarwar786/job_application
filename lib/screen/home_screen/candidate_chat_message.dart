import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/screen/Company%20Block/applications_list.dart';
import 'package:firebase_app/screen/Company%20Block/check_details_and_cv.dart';
import 'package:firebase_app/screen/home_screen/applied_jobs.dart';
import 'package:firebase_app/screen/home_screen/home_screen.dart';
import 'package:firebase_app/screen/home_screen/open_image.dart';
import 'package:firebase_app/screen/home_screen/view_image.dart';
import 'package:firebase_app/util/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

var emailUser;

class CandidateChatMessages extends StatefulWidget {
  final data, recieverMail;
  CandidateChatMessages({this.data, this.recieverMail});

  @override
  _CandidateChatMessagesState createState() => _CandidateChatMessagesState();
}

class _CandidateChatMessagesState extends State<CandidateChatMessages> {
  TextEditingController textController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  String? Textt;
  // dynamic storageImage;
  @override
  void initState() {
    super.initState();

    Messages();
    // storageImage = fireStoreImage(widget.data);
  }

  ImagePicker picker = ImagePicker();

  dialoge(context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.indigo[900],
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          title: Text(
            'Select the file',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  picker.pickImage(source: ImageSource.camera,imageQuality: 10).then((value) {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                ViewImage(value, widget.data, emailUser)));
                  });

                  // .then((value) =>
                  // print("%%%%%%%%%%%%%%%%%%%%%%%%% $value")
                  // // Navigator.push(context, MaterialPageRoute(builder: (_)=>ViewImage(value)))

                  // );
                  // // Navigator.pop(context);
                },
                icon: Icon(Icons.camera),
                color: Colors.white),
            IconButton(
              onPressed: () {
                picker.pickImage(source: ImageSource.gallery,imageQuality: 10).then((value) {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) =>
                              ViewImage(value, widget.data, emailUser)));
                });
                // .then((value) =>

                // //  Navigator.push(context, MaterialPageRoute(builder: (_)=>ViewImage(value)))
                //  print(value)
                //  );
                // Navigator.pop(context);
              },
              icon: Icon(Icons.photo),
              color: Colors.white,
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    emailUser = auth.currentUser!.email;
    // print("this is mail ${widget.recieverMail}");
    var size = MediaQuery.of(context).size;
    print(emailUser);
    return SafeArea(
      child: Scaffold(
        // floatingActionButton: FloatingActionButton(onPressed: (){
        //   print(emailUser);
        // },),
        appBar: AppBar(
          // toolbarHeight: 50,
          leading: IconButton(
            onPressed: () {
              FocusScope.of(context).unfocus();
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => HomeScreen()));
            },
            icon: Icon(
              Icons.arrow_back_ios,
            ),
          ),
          title: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => CheckDetails(widget.data)));
            },
            child: Container(
              alignment: Alignment.centerLeft,
              height: 50,
              // color: Colors.red,
              width: size.width * 0.65,
              child: Text(
                widget.data.get('CandidateData')['companyUserName'],
                maxLines: 1,
              ),
            ),
          ),
          backgroundColor: Colors.indigo[900],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: size.height * 0.83,
                child: Messages(
                  data: widget.data,
                  recieverMail: widget.recieverMail,
                ),
              ),
              Container(
                color: Colors.grey[300],
                width: size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        dialoge(context);
                      },
                      // shape: CircleBorder(),
                      icon: Icon(
                        Icons.photo_library,
                        color: Colors.blue[900],
                      ),
                      color: Colors.blue[900],
                    ),
                    Container(
                      height: 45,
                      width: size.width * 0.85,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      child: TextField(
                        onChanged: (val) {
                          Textt = val;
                        },
                        minLines: 1,
                        maxLines: 4,
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.black,
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                          suffixIcon: IconButton(
                            color: Colors.blue[900],
                            onPressed: () async {
                              FocusScope.of(context).unfocus();
                              // if ((Textt != null &&
                              //         storageImage.imageDataFromStorage == '') ||
                              //     (Textt == null &&
                              //         storageImage.imageDataFromStorage != ''))
                              try {
                                if (Textt != null) {
                                  firestore
                                      .collection("Companies")
                                      .doc(widget.data
                                          .get("CandidateData")['companyID'])
                                      .collection("ApplicationsRecevied")
                                      .doc(widget.data.id)
                                      .collection("chat")
                                      .add({
                                    'message': Textt,
                                    'image_path': "",
                                    'email': emailUser,
                                    'time': DateTime.now(),
                                  }).then((value) {
                                    // storageImage.imageDataFromStorage = '';
                                    Messages();
                                    textController.clear();
                                    Textt = "";
                                    setState(() {});
                                  });
                                }
                              } catch (e) {
                                print(e);
                              }
                            },
                            icon: Icon(
                              Icons.send,
                              color: Colors.orange.shade500,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          hintText: "Type messages",
                          hintStyle:
                              TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        controller: textController,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Messages extends StatefulWidget {
  final data, recieverMail;

  Messages({this.data, this.recieverMail});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    var email;
    var time;
    final size = MediaQuery.of(context).size;
    // final List<DocumentSnapshot> documents;
    List imgLink = [];
    List messagesDataUsed = [];
    List Mails = [];
    List times = [];
    // fireStoreImage storageImage = fireStoreImage(widget.data);
    return StreamBuilder<QuerySnapshot>(
      stream: firestore
          .collection("Companies")
          .doc(widget.data.get("CandidateData")['companyID'])
          .collection("ApplicationsRecevied")
          .doc(widget.data.id)
          .collection("chat")
          .orderBy('time', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final List<DocumentSnapshot> documents = snapshot.data!.docs;
          messagesDataUsed.clear();
          Mails.clear();
          imgLink.clear();
          times.clear();
          documents.map((e) {
            email = e['email'];

            if (email == emailUser) {
              var Data = e['message'];
              var image = e['image_path'];
              var time = e['time'];
              // if (Data != "") {
              messagesDataUsed.add(Data);
              imgLink.add(image);
              Mails.add(email);
              times.add(time);
              // }
              // if ((image == storageImage.selectedImage) || (image != '')) {
              //   messagesDataUsed.add(image);
              //   imgLink.add(image);
              //   Mails.add(email);
              //   times.add(time);
              // }
            } else if (email == widget.recieverMail) {
              var Data1 = e['message'];
              var image1 = e['image_path'];
              var time = e['time'];
              // if (Data1 != '') {
              messagesDataUsed.add(Data1);
              imgLink.add(image1);
              Mails.add(email);
              times.add(time);
              // }
              // if ((image1 == storageImage.selectedImage) || (image1 != '')) {
              //   messagesDataUsed.add(image1);
              //   imgLink.add(image1);
              //   Mails.add(email);
              //   times.add(time);
              // }
            }
          }).toList();

          print("this is reciever $messagesDataUsed");
          print("Mail link is $Mails");
          print("this is reciever $imgLink");
        }

        return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            reverse: true,
            itemCount: messagesDataUsed.length,
            itemBuilder: (BuildContext context, index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: Mails[index] != widget.recieverMail
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.start,
                  children: [
                    Mails[index] != widget.recieverMail
                        ? Container(
                            width: size.width * 0.65,
                            // height: size.height*0.05,
                            padding: const EdgeInsets.all(10),
                            // width: size.width / 2,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.blue[900],
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                            ),
                            child: messagesDataUsed[index].isNotEmpty
                                ? Column(
                                    children: [
                                      Text(
                                        messagesDataUsed[index].toString(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.bottomRight,
                                        child: Text(
                                          DateFormat('jm')
                                              .format(times[index].toDate()),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : InkWell(
                                       onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (_)=> OpenImage(imgLink[index]) ));
                                  },
                                  child: SizedBox(
                                      height: size.height * 0.2,
                                      width: size.width * 0.65,
                                      child: Image(
                                        image: NetworkImage(
                                            imgLink[index]),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                ),
                          )
                        : Container(
                            width: size.width * 0.65,
                            padding: const EdgeInsets.all(10),
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              color: Colors.teal,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                topLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                              ),
                            ),
                            child: messagesDataUsed[index].isNotEmpty
                                ? Column(
                                    children: [
                                      Text(
                                        messagesDataUsed[index].toString(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                          DateFormat('jm')
                                              .format(times[index].toDate()),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (_)=> OpenImage(imgLink[index]) ));
                                  },
                                  child: SizedBox(
                                      height: size.height * 0.2,
                                      width: size.width * 0.65,
                                      child: Image(
                                        image: NetworkImage(
                                            imgLink[index]),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                ),
                          ),
                  ],
                ),
              );
            });
      },
    );
  }
}

// class fireStoreImage {
//   final data;
//   fireStoreImage(this.data);
//   dynamic selectedImage;
//   final picker = ImagePicker();

//   Future selectImageFromCamra(context) async {
//      picker.pickImage(source: ImageSource.camera).then((value) {
//        Navigator.pop(context);
//        Navigator.push(context, MaterialPageRoute(builder: (_)=>ViewImage(value,data)));
//     });

//   }

//   Future selectImageFromGallery(context) async {
//     await picker.pickImage(source: ImageSource.gallery).then((value) {
//       Navigator.pop(context);
//       Navigator.push(context, MaterialPageRoute(builder: (_)=>ViewImage(value,data))) ;
//     });
//   }

  // Future sndPictureFireStorage() async {
  //   if (selectedImage != null) {
  //     Random random = new Random();
  //     int ran1 = random.nextInt(100000);
  //     int ran2 = random.nextInt(100000);
  //     TaskSnapshot reference =await FirebaseStorage.instance.ref().child(
  //         "chat${Constants.appUser.userId + ran1.toString() + ran2.toString()}").putFile(File(selectedImage));
  //     // UploadTask uploadTask = reference.putFile(File(selectedImage));

  //     if (reference.state == TaskState.success) {
  //         var downloadUrl = await reference.ref.getDownloadURL();
  //         print(downloadUrl);
  //     }

  //     // await uploadTask.then((pra) {
  //     //   getPicFromStorage();
  //     //   print("recieve image is $imageDataFromStorage");
  //     //   print("snd image is $selectedImage");
  //     // });
  //   }
  // }

//    dynamic imageDataFromStorage;
//   Future getPicFromStorage() async {
//     Reference reference = FirebaseStorage.instance.ref().child("chat");
//     Future task = reference.getDownloadURL();
//     return await task.then((data) {
//       imageDataFromStorage = data;
//       selectedImage = imageDataFromStorage;
//     });
//   }
// }

//  body: Container(
//         height: size.height,
//         child: Stack(
//           children: [

//             Align(
//               alignment: Alignment.topCenter,
//               child: Container(
//                 height: size.height-200.0,
//                 color: Colors.red,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   // crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     // Container(
//                     //   height: size.height * 0.83,
//                     //   child: messages(
//                     //     recieverMail: widget.recieverMail,
//                     //   ),
//                     // ),
//                     ],
//                 ),
//               ),
//             ),
//             Align(alignment: Alignment.bottomCenter,child:
//                Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Container(
//                       margin: EdgeInsets.only(left: 5, bottom: 5),
//                       width: MediaQuery.of(context).size.width * 0.45,
//                       child: TextField(
//                         onChanged: (val) {
//                           Textt = val;
//                         },
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(),
//                           hintText: "Type messages",
//                           hintStyle: TextStyle(color: Colors.black, fontSize: 20),
//                         ),
//                         controller: textController,
//                       ),
//                     ),
//                     MaterialButton(
//                       onPressed: () {
//                         storageImage.dialoge(context);
//                       },
//                       shape: CircleBorder(),
//                       child: Icon(
//                         Icons.photo_library,
//                         color: Colors.white,
//                       ),
//                       color: Colors.blue[900],
//                     ),
//                     MaterialButton(
//                       color: Colors.blue[900],
//                       onPressed: () async {
//                         try {
//                           if ((Textt != null &&
//                                   storageImage.imageDataFromStorage == '') ||
//                               (Textt == null &&
//                                   storageImage.imageDataFromStorage != '')) {
//                             firestore
//                                 .collection('chatRoom')
//                                 .doc(1.toString())
//                                 .collection('chat')
//                                 .add({
//                               'message': Textt ?? "",
//                               'image_path': storageImage.imageDataFromStorage ?? "",
//                               'email': emailUser,
//                               'time': DateTime.now(),
//                             }).then((value) {
//                               storageImage.imageDataFromStorage = '';
//                               messages();
//                               setState(() {});
//                               textController.clear();
//                             });
//                           }
//                           Textt = null;
//                         } catch (e) {
//                           print(e);
//                         }
//                       },
//                       shape: const CircleBorder(),
//                       child: const Icon(
//                         Icons.send,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//           ),

//           ],
//         ),
//       ),
