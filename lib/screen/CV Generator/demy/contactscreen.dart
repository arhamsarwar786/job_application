// // import 'package:cv_app/edcuation.dart';
// import 'package:cv_app/home.dart';
// import 'package:cv_app/pdf_page.dart';
// import 'package:flutter/material.dart';

// class ContactScreen extends StatelessWidget {
//   TextEditingController email = TextEditingController();
//   TextEditingController phoneno = TextEditingController();
//   TextEditingController linkedin = TextEditingController();

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
//                         'Add Contact',
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
//                       text: 'Email:',
//                     )),
//                 Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 20, vertical: 16),
//                     child: Textfrom(
//                       text: 'Enter email',
//                       controller: email,
//                     )),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 15,
//                   ),
//                   child: TitleName(
//                     text: 'Phone no:',
//                   ),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//                   child: Textfrom(
//                     text: 'Enter phone no',
//                     controller: phoneno,
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
//                     text: 'LinkedIn:',
//                   ),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//                   child:
//                       Textfrom(text: 'www.example.com', controller: linkedin),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 // Container(
//                 //   height: 50,
//                 //   width: 250,
//                 //   decoration: BoxDecoration(
//                 //     color: Colors.blue,
//                 //     border: Border.all(width: 3.0, color: Colors.blue),
//                 //     borderRadius: BorderRadius.all(Radius.circular(25.0)),
//                 //   ),
//                 //   child: MaterialButton(
//                 //     onPressed: () async {
//                 //       // Navigator.push(
//                 //       //   context,
//                 //       //   MaterialPageRoute(builder: (context) => Edcuationpage()),
//                 //       // );
//                 //       final pdfFile = await PdfApi.generateCenteredText({
//                 // "email": email.text,
//                 // "phoneno": phoneno.text,
//                 // "linkedin": linkedin.text
//                 //       });
//                 //       PdfApi.openFile(pdfFile);
//                 //     },
//                 //     child: const Text('Next',
//                 //         style: TextStyle(color: Colors.white)),
//                 //   ),
//                 // ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
