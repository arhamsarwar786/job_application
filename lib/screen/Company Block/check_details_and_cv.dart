import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/screen/CV%20Generator/pdf_page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CheckDetails extends StatelessWidget {
  final data;
  CheckDetails(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.60,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(data.get("CandidateImage")), fit: BoxFit.fill)),
              ),
              Text(
                // "${data.get('CandidateData')['firstName']}",
                "${data.get("CandidateData")['firstName']}",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.w800),
              ),
              Text(
                "${data.get("CandidateData")['designation']}",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                "${data.get('CandidateData')['residing']}",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w300),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 40,
                      width: 60,
                      child: IconButton(onPressed: (){
                        _makePhoneCall(data.get('CandidateData')['phoneno']);
                      }, icon: Icon(Icons.phone),),),
                  Container(
                      height: 50,
                      width: 60,
                      child: IconButton(onPressed: (){
                        _launchEmail(data.get('CandidateData')['email']);
                      }, icon: Icon(Icons.email),),),
                  Container(
                      height: 60,
                      width: 60,
                      child: IconButton(onPressed: (){
                        _launchURL(data.get('CandidateData')['linkedin']);
                      }, icon: Icon(Icons.link),),),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.48,
                    child: MaterialButton(
                      child: const Text(
                        "Check CV ",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                      ),
                      onPressed: () async {
                        var cvData = data.data();

                        final pdfFile = await PdfApi.generateCenteredText(
                            cvData!["CandidateData"],cvData!['CandidateImage']);
                        PdfApi.openFile(pdfFile);
                      },
                      color: Colors.blue[900],
                      padding: const EdgeInsets.fromLTRB(9, 9, 9, 9),
                      splashColor: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.48,
                    child: MaterialButton(
                      child: const Text(
                        "Contact me",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                      ),
                      onPressed: () {
                        _makePhoneCall(data.get('CandidateData')['phoneno']);
                      },
                      color: Colors.blue[900],
                      padding: const EdgeInsets.fromLTRB(9, 9, 9, 9),
                      splashColor: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


  void _launchEmail(email) async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: '$email',
    );
    String  url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print( 'Could not launch $url');
    }
  }



_launchURL(urL) async {
  var url = '$urL';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
  Future<void> _makePhoneCall(String phoneNumber) async {
    // Use `Uri` to ensure that `phoneNumber` is properly URL-encoded.
    // Just using 'tel:$phoneNumber' would create invalid URLs in some cases,
    // such as spaces in the input, which would cause `launch` to fail on some
    // platforms.
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launch(launchUri.toString());
  }
}
