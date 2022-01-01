import 'widgets/button.dart';
import 'widgets/custom_textfield.dart';
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Add",
            ),
            Text(
              "Certificate",
              style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
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
            Button(btnText: "Save Changes"),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}