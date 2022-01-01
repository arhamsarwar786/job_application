// import 'dart:async';

// import 'package:cv_app/contactscreen.dart';
// import 'package:cv_app/pdf_page.dart';
// import 'package:flutter/material.dart';

// class Home extends StatelessWidget {
//   TextEditingController firstName = TextEditingController();
//   TextEditingController lastName = TextEditingController();
//   TextEditingController residing = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: SingleChildScrollView(
//           child: Form(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   height: 150,
//                   width: 150,
//                   child: CircularImageCard(
//                     image: 'assets/image.jpg',
//                     scale: 5,
//                   ),
//                 ),
//                 Padding(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 15,
//                     ),
//                     child: TitleName(
//                       text: 'First Name:',
//                     )),
//                 Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 20, vertical: 16),
//                     child: Textfrom(
//                       text: 'Enter name',
//                       controller: firstName,
//                     )),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 15,
//                   ),
//                   child: TitleName(
//                     text: 'Last name:',
//                   ),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//                   child: Textfrom(
//                     text: 'Enter name',
//                     controller: lastName,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 15,
//                   ),
//                   child: TitleName(
//                     text: 'Residing city:',
//                   ),
//                 ),

//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//                   child: Textfrom(
//                     text: 'Enter residing city',
//                     controller: residing,
//                   ),
//                 ),

//                 // TextFormField(
//                 //   decoration: const InputDecoration(
//                 //       fillColor: Colors.grey, focusColor: Colors.grey),
//                 //   validator: (value) {
//                 //     if (value!.isEmpty) {
//                 //       return 'Your email';
//                 //     }
//                 //     return null;
//                 //   },
//                 // ),
//                 // TextFormField(),
//                 // TextField(
//                 //   controller: numbertext,
//                 // ),
//                 // TextField(
//                 //   controller: nametext,
//                 // ),
//                 // TextField(
//                 //   controller: emailtext,
//                 // ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Container(
//                   height: 50,
//                   width: 250,
//                   decoration: BoxDecoration(
//                     color: Colors.blue,
//                     border: Border.all(width: 3.0, color: Colors.blue),
//                     borderRadius: BorderRadius.all(Radius.circular(25.0)),
//                   ),
//                   child: MaterialButton(
//                     onPressed: () async {
//                       final pdfFile = await PdfApi.generateCenteredText({
//                         "firstName": firstName.text,
//                         "lastName": lastName.text,
//                         "residing": residing.text
//                       });
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => ContactScreen()),
//                       );
//                       PdfApi.openFile(pdfFile);
//                     },
//                     child: const Text('Next',
//                         style: TextStyle(color: Colors.white)),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class Textfrom extends StatelessWidget {
//   String? text;
//   TextEditingController? controller;
//   Textfrom({
//     this.text,
//     this.controller,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: controller,
//       decoration: InputDecoration(
//         border: OutlineInputBorder(),
//         fillColor: Colors.grey,
//         focusColor: Colors.grey,
//         hintText: text!,
//       ),
//     );
//   }
// }

// class TitleName extends StatelessWidget {
//   String? text;
//   TitleName({
//     this.text,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Text(
//           text!,
//           style: TextStyle(fontSize: 20),
//         ),
//       ],
//     );
//   }
// }

// //--//

// class CircularImageCard extends StatelessWidget {
//   CircularImageCard({this.image, this.scale});

//   final String? image;
//   final double? scale;

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: (1 + scale!) * 4,
//       clipBehavior: Clip.antiAlias,
//       shape:
//           CircleBorder(side: BorderSide(color: Colors.grey.shade200, width: 0)),
//       child: Padding(
//         padding: EdgeInsets.all(8 * (1 + scale!)),
//         child: Image.asset(
//           image!,
//           fit: BoxFit.contain,
//         ),
//       ),
//     );
//   }
// }
