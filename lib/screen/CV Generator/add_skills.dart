import 'package:firebase_app/screen/CV%20Generator/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class AddSkills extends StatelessWidget {
  List addskills;
  AddSkills(
    this.addskills,
  );
  TextEditingController lang = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        backgroundColor: Colors.blue[900],
        title: Text(
          "AddSkills",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[900],
        child: Icon(Icons.save),
        onPressed: () {
          addskills.add({
            "lang": lang.text,
          });
          Navigator.pop(context, addskills);
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10.0),
            CustomTextField(
              controller: lang,
              labelText: "Language",
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