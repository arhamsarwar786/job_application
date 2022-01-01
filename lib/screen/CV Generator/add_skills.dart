import 'widgets/custom_textfield.dart';
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Add",
            ),
            Text(
              "Skills",
              style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
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