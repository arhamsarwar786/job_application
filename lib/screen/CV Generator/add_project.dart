import 'widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class AddProject extends StatelessWidget {
  List addProject;
  AddProject(
    this.addProject,
  );
  TextEditingController date = TextEditingController();
  TextEditingController name = TextEditingController();
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
              "Project",
              style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () {
          addProject.add({
            "date": date.text,
            "name": name.text,
            "lang": lang.text,
          });
          Navigator.pop(context, addProject);
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10.0),
            CustomTextField(
              controller: date,
              labelText: "Years",
              hintText: "2016-2012",
              iconText: Icon(Icons.person_outline),
              ratio: 1.0,
            ),
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