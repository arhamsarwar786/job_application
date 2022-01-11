import 'dart:io';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/screen/Company%20Block/applications_list.dart';
import 'package:firebase_app/screen/Company%20Block/check_details_and_cv.dart';
import 'package:firebase_app/util/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

var emailUser;

class ChatMessages extends StatefulWidget {
  final data, recieverMail;
  ChatMessages({this.data, this.recieverMail});

  @override
  _ChatMessagesState createState() => _ChatMessagesState();
}

class _ChatMessagesState extends State<ChatMessages> {
  TextEditingController textController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  String? Textt;
  @override
  void initState() {
    super.initState();

    Messages();
    // emailUser = widget.data.get('CandidateData')['email'];
  }

  fireStoreImage storageImage = fireStoreImage();
  @override
  Widget build(BuildContext context) {
    // print("this is mail ${widget.recieverMail}");
    var size = MediaQuery.of(context).size;
    emailUser = auth.currentUser!.email;
    print(emailUser);
    return Scaffold(
      // floatingActionButton: FloatingActionButton(onPressed: (){
      //   print(widget.recieverMail);
      // },),
      appBar: AppBar(
        // toolbarHeight: 50,
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => ApplicationsList()));
            },
            icon: Icon(Icons.arrow_back_ios)),
        title: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => CheckDetails(widget.data)));
          },
          child: Container(
            alignment: Alignment.centerLeft,
            height: 50,
            // color: Colors.red,
            width: size.width * 0.70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage:
                      NetworkImage(widget.data.get('CandidateImage')),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  widget.data.get('CandidateData')['firstName'],
                  maxLines: 1,
                ),
              ],
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
                      storageImage.dialoge(context);
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
                                    .doc(Constants.appUser.userId)
                                    .collection("ApplicationsRecevied")
                                    .doc(widget.data.id)
                                    .collection("chat")
                                    .add({
                                  'message': Textt,
                                  'image_path':
                                      storageImage.imageDataFromStorage ?? "",
                                  'email': emailUser,
                                  'time': DateTime.now(),
                                }).then((value) {
                                  storageImage.imageDataFromStorage = '';
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
                        hintStyle: TextStyle(color: Colors.black, fontSize: 20),
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
    fireStoreImage storageImage = fireStoreImage();
    return StreamBuilder<QuerySnapshot>(
      stream: firestore
          .collection("Companies")
          .doc(Constants.appUser.userId)
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
            print(email);
            if (email == emailUser) {
              var Data = e['message'];
              var image = e['image_path'];
              var time = e['time'];
              // if (Data != "") {
              messagesDataUsed.add(Data);
              imgLink.add(time);
              Mails.add(email);
              times.add(time);
              // }
              print(messagesDataUsed.length);
              if ((image == storageImage.selectedImage) || (image != '')) {
                messagesDataUsed.add(image);
                imgLink.add(image);
                Mails.add(email);
                times.add(time);
              }
            } else if (email == widget.recieverMail) {
              print("Matched");
              var Data1 = e['message'];
              var image1 = e['image_path'];
              var time = e['time'];
              // if (Data1 != '') {
              messagesDataUsed.add(Data1);
              imgLink.add(time);
              Mails.add(email);
              times.add(time);
              // }
              if ((image1 == storageImage.selectedImage) || (image1 != '')) {
                messagesDataUsed.add(image1);
                imgLink.add(image1);
                Mails.add(email);
                times.add(time);
              }
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
              print(messagesDataUsed.length);
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: Mails[index] != widget.recieverMail
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.start,
                  children: [
                    Mails[index] != widget.recieverMail
                        ? Container(
                            width: size.width * 0.70,
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
                            child: messagesDataUsed[index] != imgLink[index]
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
                                : SizedBox(
                                    height: size.height * 0.2,
                                    child: Image(
                                      image: NetworkImage(
                                          messagesDataUsed[index].toString()),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                          )
                        : Container(
                            width: size.width * 0.70,
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
                            child: messagesDataUsed[index] != imgLink[index]
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
                                : SizedBox(
                                    height: size.height * 0.2,
                                    child: Image(
                                      image: NetworkImage(
                                          messagesDataUsed[index].toString()),
                                      fit: BoxFit.fill,
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

class fireStoreImage {
  dynamic selectedImage;
  final picker = ImagePicker();

  Future selectImageFromCamra() async {
    await picker.pickImage(source: ImageSource.camera).then((value) {
      selectedImage = value!.path;
    });
  }

  Future selectImageFromGallery() async {
    await picker.pickImage(source: ImageSource.gallery).then((value) {
      selectedImage = value!.path;
    });
  }

  Future sndPictureFireStorage() async {
    if (selectedImage != null) {
      Reference reference = FirebaseStorage.instance.ref().child("chat/");
      UploadTask uploadTask = reference.putFile(File(selectedImage));

      await uploadTask.then((pra) {
        getPicFromStorage();
        print("recieve image is $imageDataFromStorage");

        print("snd image is $selectedImage");
      });
    }
  }

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
                  selectImageFromCamra()
                      .then((value) => sndPictureFireStorage());
                },
                icon: Icon(Icons.camera),
                color: Colors.white),
            IconButton(
              onPressed: () {
                selectImageFromGallery()
                    .then((value) => sndPictureFireStorage());
              },
              icon: Icon(Icons.photo),
              color: Colors.white,
            )
          ],
        );
      },
    );
  }

  dynamic imageDataFromStorage;
  Future getPicFromStorage() async {
    Reference reference = FirebaseStorage.instance.ref().child("chat");
    Future task = reference.getDownloadURL();
    return await task.then((data) {
      imageDataFromStorage = data;
      selectedImage = imageDataFromStorage;
    });
  }
}





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