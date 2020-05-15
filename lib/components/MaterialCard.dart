import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/MyMaterial.dart';
import '../styles.dart';

class MaterialCard extends StatefulWidget {
  final MyMaterial material;

  MaterialCard({this.material});

  @override
  MaterialCardState createState() => MaterialCardState();
}

class MaterialCardState extends State<MaterialCard> {
  void showAlert(BuildContext context) async {
    AlertDialog dialog = AlertDialog(
      title: Text(widget.material.name),
      content: Text(
          "Vous avez X absences, vous ne pouvez plus manquer que Y cours !"),
      actions: <Widget>[
        FlatButton(
          child: Text("+ 1"),
          onPressed: () {},
        ),
        FlatButton(
          child: Text("- 1"),
          onPressed: () {},
        ),
        FlatButton(
          child: Text("Annuler"),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );

    showDialog(context: context, builder: (ctx) => dialog);
  }

  MaterialColor chooseColor() {
    if (widget.material.absences == 0) {
      return Colors.green;
    } else if (widget.material.absences == 1) {
      return Colors.amber;
    }
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showAlert(context),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            color: chooseColor()),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  widget.material.name,
                  style: CustomStyles.materialCardsHeadline,
                ),
                Spacer(),
                Text(
                  widget.material.absences.toString(),
                  style: CustomStyles.materialCardsBody,
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Icon(
                  CupertinoIcons.time,
                  size: 14,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  "Restantes",
                  style: CustomStyles.materialCardsBody,
                ),
                Spacer(),
                Text(
                  // TODO: Faire le calcul
                  "0",
                  style: CustomStyles.materialCardsBody,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
