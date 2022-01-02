import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class PdfApi {
  static Future<File> generateCenteredText(dynamic data, imageStored) async {
    http.Response response = await http.get(Uri.parse(imageStored));
    final image = pw.MemoryImage(response.bodyBytes);
    final pdf = pw.Document();
    final imageJpg =
        (await rootBundle.load('assets/bg1.jpg')).buffer.asUint8List();
    final pageTheme = PageTheme(
        pageFormat: PdfPageFormat.a4,
        buildBackground: (context) {
          return FullPage(
              ignoreMargins: true,
              child: pw.Image(
                pw.MemoryImage(imageJpg),
                fit: pw.BoxFit.cover,
              ));
        });
    pdf.addPage(
      pw.Page(
          pageTheme: pageTheme,
          build: (context) {
            return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                // pw.Image(
                //   pw.MemoryImage(imageJpg),
                // ),
                pw.Container(
                  width: PdfPageFormat.a3.width,
                  // color: PdfColors.blue200,
                  child: pw.Row(
                    children: [
                      pw.SizedBox(width: 20.0),
                      pw.Container(
                        height: 150,
                        width: 100,
                        decoration: pw.BoxDecoration(
                            borderRadius: pw.BorderRadius.circular(10),
                            image: pw.DecorationImage(
                                image: pw.MemoryImage(image.bytes))),
                      ),
                      pw.SizedBox(width: 50.0),
                      pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.center,
                        children: [
                          pw.Text(
                            data['firstName'],
                            style: pw.TextStyle(
                              fontSize: 35,
                              color: PdfColors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          pw.SizedBox(height: 10.0),
                          // pw.Padding(
                          // padding: pw.EdgeInsets.only(left: 150),
                          pw.Text(data['designation'],
                              style: pw.TextStyle(
                                fontSize: 20.0,
                              )),
                          // ),
                          pw.SizedBox(
                            height: 50,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                pw.Divider(),
                pw.SizedBox(
                  height: 40,
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  children: [
                    pw.Container(
                      width: 170,
                      child: pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        children: [
                          pw.Divider(),
                          pw.Text(
                            "PERSONAL",
                            style: pw.TextStyle(
                                fontSize: 18.0, fontWeight: pw.FontWeight.bold),
                          ),
                          pw.SizedBox(
                            height: 5,
                          ),
                          pw.Container(
                            width: 140,
                            child: pw.Text(
                              data['personal'],
                              style: pw.TextStyle(
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                          pw.SizedBox(
                            height: 5,
                          ),
                          pw.Divider(),
                          pw.Text(
                            "SKILLS      ",
                            style: pw.TextStyle(
                                fontSize: 18.0, fontWeight: pw.FontWeight.bold),
                          ),
                          pw.SizedBox(
                            height: 5,
                          ),
                          pw.Container(
                            width: 140,
                            child: pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              children: [
                                for (int i = 0; i < data['skills'].length; i++)
                                  pw.Row(
                                      crossAxisAlignment:
                                          pw.CrossAxisAlignment.start,
                                      children: [
                                        pw.Text("${i + 1} -"),
                                        pw.Container(
                                          width: 130,
                                          child: pw.Text(
                                              " ${data['skills'][i]['lang']}"),
                                        ),
                                      ]),
                              ],
                            ),
                          ),
                          pw.SizedBox(
                            height: 10,
                          ),
                          pw.Divider(),
                          pw.Text(
                            "EXPERIENCE",
                            style: pw.TextStyle(
                                fontSize: 18.0, fontWeight: pw.FontWeight.bold),
                          ),
                          pw.SizedBox(
                            height: 5,
                          ),
                          pw.Container(
                            width: 140,
                            child: pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              children: [
                                for (int i = 0;
                                    i < data['experience'].length;
                                    i++)
                                  pw.Row(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text(" ${i + 1}- "),
                                      pw.Container(
                                        width: 130,
                                        child: pw.Text(
                                            "${data['experience'][i]['job']}    ${data['experience'][i]['campany']}  ${data['experience'][i]['date']}"),
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                          pw.SizedBox(
                            height: 5,
                          ),
                          pw.SizedBox(
                            height: 10,
                          ),
                          pw.Divider(),
                          pw.Text(
                            "CERTIFICATE",
                            style: pw.TextStyle(
                                fontSize: 18.0, fontWeight: pw.FontWeight.bold),
                          ),
                          pw.SizedBox(
                            height: 5,
                          ),
                          pw.Container(
                            width: 140,
                            child: pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              children: [
                                for (int i = 0;
                                    i < data['certicate'].length;
                                    i++)
                                  pw.Row(
                                      crossAxisAlignment:
                                          pw.CrossAxisAlignment.start,
                                      children: [
                                        pw.Text(" ${i + 1}-  "),
                                        pw.Container(
                                          width: 130,
                                          child: pw.Text(
                                              "${data['certicate'][i]['name']}   ${data['certicate'][i]['date']}"),
                                        ),
                                      ]),
                              ],
                            ),
                          ),
                          pw.SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                    pw.SizedBox(
                      width: 50,
                    ),
                    pw.Container(
                      width: 280,
                      child: pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.center,
                        children: [
                          pw.Divider(),
                          pw.Text(
                            "EDUCATION HISTORY",
                            style: pw.TextStyle(
                                fontSize: 18.0, fontWeight: pw.FontWeight.bold),
                          ),
                          pw.SizedBox(
                            height: 5,
                          ),
                          pw.Container(
                            width: 140,
                            child: pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              children: [
                                for (int i = 0;
                                    i < data['edcution'].length;
                                    i++)
                                  pw.Container(
                                    width: 140,
                                    child: pw.Row(
                                        crossAxisAlignment:
                                            pw.CrossAxisAlignment.start,
                                        children: [
                                          pw.Text(" ${i + 1} - "),
                                          pw.Container(
                                            width: 150,
                                            child: pw.Text(
                                                "${data['edcution'][i]['school']} \t ${data['edcution'][i]['date']}"),
                                          ),
                                        ]),
                                  ),
                              ],
                            ),
                          ),
                          pw.SizedBox(
                            height: 5,
                          ),
                          pw.Divider(),
                          pw.Text(
                            "PROJECT",
                            style: pw.TextStyle(
                                fontSize: 18.0, fontWeight: pw.FontWeight.bold),
                          ),
                          pw.SizedBox(
                            height: 5,
                          ),
                          pw.Container(
                            width: 140,
                            child: pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              children: [
                                for (int i = 0; i < data['project'].length; i++)
                                  pw.Row(children: [
                                    pw.Text(" ${i + 1}- "),
                                    pw.Container(
                                      width: 130,
                                      child: pw.Text(
                                          "${data['project'][i]['name']}  ${data['project'][i]['date']}  ${data['project'][i]['lang']}"),
                                    ),
                                  ]),
                              ],
                            ),
                          ),
                          pw.SizedBox(
                            height: 5,
                          ),
                          pw.Divider(),
                          pw.Text(
                            "GET IN CONTACT",
                            style: pw.TextStyle(
                                fontSize: 18.0, fontWeight: pw.FontWeight.bold),
                          ),
                          pw.SizedBox(
                            height: 10,
                          ),
                          pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              children: [
                                pw.Row(
                                  mainAxisAlignment: pw.MainAxisAlignment.start,
                                  children: [
                                    pw.Text(
                                      'phone no: ',
                                      style: pw.TextStyle(
                                        fontSize: 15.0,
                                      ),
                                    ),
                                    pw.SizedBox(
                                      width: 5,
                                    ),
                                    pw.Container(
                                      width: 140,
                                      child: pw.Text(
                                        data['phoneno'],
                                        style: pw.TextStyle(
                                          fontSize: 15.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                pw.SizedBox(
                                  height: 5,
                                ),
                                pw.Row(
                                  mainAxisAlignment: pw.MainAxisAlignment.start,
                                  children: [
                                    pw.Text(
                                      'Email: ',
                                      style: pw.TextStyle(
                                        fontSize: 15.0,
                                      ),
                                    ),
                                    pw.SizedBox(
                                      width: 5,
                                    ),
                                    pw.Container(
                                      width: 190,
                                      child: pw.Text(
                                        data['email'],
                                        style: pw.TextStyle(
                                          fontSize: 15.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                pw.SizedBox(
                                  height: 5,
                                ),
                                pw.Row(
                                  mainAxisAlignment: pw.MainAxisAlignment.start,
                                  children: [
                                    pw.Text(
                                      'Location: ',
                                      style: pw.TextStyle(
                                        fontSize: 15.0,
                                      ),
                                    ),
                                    pw.SizedBox(
                                      width: 5,
                                    ),
                                    pw.Container(
                                      width: 190,
                                      child: pw.Text(
                                        data['residing'],
                                        style: pw.TextStyle(
                                          fontSize: 15.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                pw.SizedBox(
                                  height: 5,
                                ),
                                pw.Row(
                                  mainAxisAlignment: pw.MainAxisAlignment.start,
                                  children: [
                                    pw.Text(
                                      'LinkedIn: ',
                                      style: pw.TextStyle(
                                        fontSize: 15.0,
                                      ),
                                    ),
                                    pw.SizedBox(
                                      width: 5,
                                    ),
                                    buildlink(data)
                                    // pw.Container(
                                    //   width: 190,
                                    //   child: pw.Text(
                                    //     data['linkedin'],
                                    //     style: pw.TextStyle(
                                    //       fontSize: 15.0,
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),
                                pw.SizedBox(
                                  height: 5,
                                ),
                              ]),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          }),
    );
    return saveDocument(name: 'name.pdf', pdf: pdf);
  }

  static Future<File> saveDocument({
    required String name,
    required pw.Document pdf,
  }) async {
    final bytes = await pdf.save();
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');
    await file.writeAsBytes(bytes);
    return file;
  }

  // static Future<File> generateImage() async {}

  static pw.Widget buildlink(dynamic data) => UrlLink(
        destination: data['linkedin'],
        child: pw.Container(
          width: 190,
          child: pw.Text(data['linkedin'],
              style: pw.TextStyle(
                fontSize: 15,
                decoration: TextDecoration.underline,
                color: PdfColors.blue,
              )),
        ),
      );

  static Future openFile(File file) async {
    final url = file.path;
    await OpenFile.open(url);
  }
}
