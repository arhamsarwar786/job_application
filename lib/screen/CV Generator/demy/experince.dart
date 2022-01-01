// import 'package:cv_app/edcuation.dart';
// import 'package:cv_app/home.dart';
// import 'package:flutter/material.dart';

// class Experincepage extends StatelessWidget {
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
//                         'Add Experience',
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
//                       text: 'Your Company',
//                     )),
//                 Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 20, vertical: 16),
//                     child: Textfrom(
//                       text: 'name of company',
//                     )),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 15,
//                   ),
//                   child: TitleName(
//                     text: 'Company website',
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
//                     text: 'Your designation',
//                   ),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//                   child: Textfrom(text: 'what was your role?'),
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
//                       // Navigator.push(context,MaterialPageRoute(builder: (context) => SecondRoute()),);
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
