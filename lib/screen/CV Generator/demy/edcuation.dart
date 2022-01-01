// import 'package:cv_app/experince.dart';
// import 'package:cv_app/home.dart';
// import 'package:flutter/material.dart';

// class Edcuationpage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: SingleChildScrollView(
//           child: Form(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(28.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Add Edcuation',
//                         style: TextStyle(fontSize: 35),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Padding(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 15,
//                     ),
//                     child: TitleName(
//                       text: 'Your University',
//                     )),
//                 Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 20, vertical: 16),
//                     child: Textfrom(
//                       text: 'name of university',
//                     )),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 15,
//                   ),
//                   child: TitleName(
//                     text: 'University website',
//                   ),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//                   child: Textfrom(text: 'www.example.com'),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 15,
//                   ),
//                   child: TitleName(
//                     text: 'Your Course',
//                   ),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//                   child: Textfrom(text: 'what course or degree you took'),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 10),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 15,
//                         ),
//                         child: TitleNameSmall(
//                           text: 'Start Date',
//                         ),
//                       ),
//                       SizedBox(
//                         width: 5,
//                       ),
//                       Container(
//                           height: 50,
//                           width: 100,
//                           child: Textfrom(text: 'date')),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 10),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 15,
//                         ),
//                         child: TitleNameSmall(
//                           text: 'End Date  ',
//                         ),
//                       ),
//                       SizedBox(
//                         width: 5,
//                       ),
//                       Container(
//                           height: 50,
//                           width: 100,
//                           child: Textfrom(text: 'date')),
//                     ],
//                   ),
//                 ),
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
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => Experincepage()),
//                       );
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

// class TitleNameSmall extends StatelessWidget {
//   String? text;
//   TitleNameSmall({
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
//           style: TextStyle(fontSize: 15),
//         ),
//       ],
//     );
//   }
// }
