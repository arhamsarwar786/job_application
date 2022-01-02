import 'package:firebase_app/screen/CV%20Generator/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class AddEducation extends StatelessWidget {
  List addEducation;
  AddEducation(
    this.addEducation,
  );
  TextEditingController date = TextEditingController();
  TextEditingController school = TextEditingController();

  TextEditingController faulty = TextEditingController();
  TextEditingController dept = TextEditingController();
  TextEditingController adtion = TextEditingController();
  TextEditingController grde = TextEditingController();
  // List addEdcution = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        elevation: 1.0,
        title: Text(
          "AddEducation",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[900],
        child: Icon(Icons.save),
        onPressed: () {
          addEducation.add({
            "date": date.text,
            "school": school.text,
            "faulty": faulty.text,
            "dapt": dept.text,
            "adtion": adtion.text,
            "grde": grde.text,
          });
          Navigator.pop(context, addEducation);
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
              iconText: Icon(Icons.layers),
              ratio: 1.0,
            ),
            SizedBox(height: 10.0),
            CustomTextField(
              controller: school,
              labelText: "School",
              hintText: "",
              iconText: Icon(Icons.school),
              ratio: 1.0,
            ),
            SizedBox(height: 10.0),
            CustomTextField(
              controller: faulty,
              labelText: "Faculty",
              hintText: "",
              iconText: Icon(Icons.person_outline),
              ratio: 1.0,
            ),
            SizedBox(height: 10.0),
            CustomTextField(
              controller: dept,
              labelText: "Department",
              hintText: "",
              iconText: Icon(Icons.person_outline),
              ratio: 1.0,
            ),
            SizedBox(height: 10.0),
            // CustomTextField(
            //   controller: grde,
            //   labelText: "Grade",
            //   hintText: "",
            //   iconText: Icon(Icons.note_add),
            //   ratio: 1.0,
            // ),
            SizedBox(height: 10.0),
            // CustomTextField(
            //   controller: adtion,
            //   labelText: "Additional Notes",
            //   hintText: "",
            //   iconText: Icon(Icons.note_add),
            //   ratio: 1.0,
            // ),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}