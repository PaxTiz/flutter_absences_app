import 'package:absences/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MaterialForm extends StatefulWidget {
  createState() => MaterialFormState();
}

class MaterialFormState extends State<MaterialForm> {
  final List<String> ues = ["Informatique", "Général"];
  String ueValue = "Informatique";

  void sendForm() {}

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Nom de la matière"),
            ),
            SizedBox(
              height: 32,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Nombre d'heures pendant le semestre"),
            ),
            SizedBox(
              height: 32,
            ),
            Text("Unité d'enseignement"),
            DropdownButton(
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
            CupertinoButton(
              color: Colors.blue,
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
              onPressed: () => sendForm(),
              child: Text(
                "Ajouter",
                style: CustomStyles.button,
              ),
            ),
            Spacer(),
            Container(
              width: double.infinity,
              child: CupertinoButton(
                color: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                onPressed: () => sendForm(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.add),
                    Text(
                      "Nouveau semestre",
                      style: CustomStyles.button,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
