import 'package:absences/components/MaterialForm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MaterialCreate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gestion des absences"),
      ),
      body: MaterialForm(),
    );
  }
}
