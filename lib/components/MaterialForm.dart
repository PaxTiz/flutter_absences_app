import 'package:absences/main.dart';
import 'package:absences/models/MyMaterial.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../models/Semester.dart';
import '../services/MaterialService.dart';
import '../styles.dart';

class MaterialForm extends StatefulWidget {
  createState() => MaterialFormState();
}

class MaterialFormState extends State<MaterialForm> {
  final List<String> ues = ["Informatique", "Général"];
  String ueValue;

  MaterialService service = MaterialService();
  Semester semesterValue;
  List<Semester> semestersDropdown = [
    Semester(id: 1, name: "Semestre 1"),
    Semester(id: 2, name: "Semestre 2"),
    Semester(id: 3, name: "Semestre 3"),
    Semester(id: 4, name: "Semestre 4")
  ];

  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final hoursController = TextEditingController();

  @override
  void initState() {
    super.initState();
    semesterValue = semestersDropdown.first;
    ueValue = ues.first;
  }

  void sendForm(BuildContext context) {
    if (_formKey.currentState.validate()) {
      service.insertSemester(MyMaterial(
          name: nameController.text,
          totalHours: int.parse(hoursController.text),
          ue: ueValue,
          absences: 0,
          semester_id: semesterValue.id));
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (ctx) => Absences()), (route) => false);
    }
  }

  Widget dropdownItems() {
    return DropdownButtonFormField<Semester>(
      value: semesterValue,
      isExpanded: true,
      items: semestersDropdown
          .map((e) => DropdownMenuItem<Semester>(
                value: e,
                child: Text(e.name),
              ))
          .toList(),
      onChanged: (item) {
        setState(() {
          semesterValue = item;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Nom de la matière"),
              validator: (value) =>
                  value.isEmpty ? "Merci d'entrer le nom de la matière" : null,
            ),
            SizedBox(
              height: 32,
            ),
            TextFormField(
              controller: hoursController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Nombre d'heures pendant le semestre"),
              validator: (value) => value.isEmpty
                  ? "Merci de choisir un nombre d'heures maximum"
                  : null,
            ),
            SizedBox(
              height: 32,
            ),
            Text("Unité d'enseignement"),
            DropdownButtonFormField(
              value: ueValue,
              isExpanded: true,
              items: ues
                  .map((ue) => DropdownMenuItem(
                        child: Text(ue),
                        value: ue,
                      ))
                  .toList(),
              onChanged: (item) {
                setState(() {
                  ueValue = item;
                });
              },
            ),
            SizedBox(
              height: 32,
            ),
            Text("Semestre"),
            dropdownItems(),
            SizedBox(
              height: 32,
            ),
            CupertinoButton(
              color: Colors.blue,
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
              onPressed: () => sendForm(context),
              child: Text(
                "Ajouter",
                style: CustomStyles.button,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    hoursController.dispose();
  }
}
