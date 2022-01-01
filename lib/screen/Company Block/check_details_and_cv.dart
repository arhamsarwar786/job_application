

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/screen/CV%20Generator/pdf_page.dart';
import 'package:flutter/material.dart';

class CheckDetails extends StatelessWidget {
  final  data;
  CheckDetails(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(child: Text("Download CV"),onPressed: ()async{

          var cvData = data.data();
          // var d = cvData!["CandidateData"];
          // print(cvData!["CandidateData"]);
            final pdfFile =
            await PdfApi.generateCenteredText(cvData!["CandidateData"]);
                                    PdfApi.openFile(pdfFile);
        },)
      ),
    );
  }
}