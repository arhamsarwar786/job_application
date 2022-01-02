import 'package:firebase_app/screen/CV%20Generator/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class AddCertificate extends StatelessWidget {
  List addcertificate;
  AddCertificate(this.addcertificate);
  TextEditingController name = TextEditingController();
  TextEditingController issue = TextEditingController();
  TextEditingController date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        backgroundColor: Colors.blue[900],
        title: Text(
          "AddCertificate",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[900],
        child: Icon(Icons.save),
        onPressed: () {
          addcertificate.add({
            "date": date.text,
            "issue": issue.text,
            "name": name.text,
          });
          Navigator.pop(context, addcertificate);
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10.0),
            CustomTextField(
              controller: name,
              labelText: "Name",
              hintText: "",
              iconText: Icon(Icons.person_outline),
              ratio: 1.0,
            ),
            SizedBox(height: 10.0),
            CustomTextField(
              controller: issue,
              labelText: "Issued By",
              hintText: "",
              iconText: Icon(Icons.person_outline),
              ratio: 1.0,
            ),
            SizedBox(height: 10.0),
            CustomTextField(
              controller: date,
              labelText: "Date",
              hintText: "",
              iconText: Icon(Icons.person_outline),
              ratio: 1.0,
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}