import 'package:firebase_app/screen/CV%20Generator/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class AddExperience extends StatelessWidget {
  List addExperince;
  AddExperience(
    this.addExperince,
  );
  TextEditingController date = TextEditingController();
  TextEditingController campany = TextEditingController();
  TextEditingController job = TextEditingController();
  TextEditingController dept = TextEditingController();
  TextEditingController adtion = TextEditingController();
  TextEditingController grde = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        elevation: 1.0,
        title: Text(
          "AddExperience",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[900],
        child: Icon(Icons.save),
        onPressed: () {
          addExperince.add({
            "date": date.text,
            "campany": campany.text,
            "job": job.text,
            "dapt": dept.text,
            "adtion": adtion.text,
            "grde": grde.text,
          });
          Navigator.pop(context, addExperince);
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
              controller: campany,
              labelText: "Company",
              hintText: "",
              iconText: Icon(Icons.person_outline),
              ratio: 1.0,
            ),
            SizedBox(height: 10.0),
            CustomTextField(
              controller: job,
              labelText: "Job Title",
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
            CustomTextField(
              controller: adtion,
              labelText: "Additional Notes",
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