import 'package:absences/components/text/TextStyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MaterialCard extends StatefulWidget {
	createState() => MaterialCardState();
}

class MaterialCardState extends State<MaterialCard> {

	@override
	Widget build(BuildContext context) {
		return Container(
			padding: EdgeInsets.all(16),
			decoration: BoxDecoration(
				borderRadius: BorderRadius.all(Radius.circular(16)),
				color: Colors.blue
			),
			child: Column(
				children: <Widget>[
					Row(
						children: <Widget>[
							Text("SE1", style: TextStyles.materialCardTitle,),
							Spacer(),
							Text("0", style: TextStyles.materialCardText,),
						],
					),
					SizedBox(height: 8,),
					Row(
						children: <Widget>[
							Icon(CupertinoIcons.time, size: 14, color: Colors.white,),
							SizedBox(width: 4,),
							Text("Restantes", style: TextStyles.materialCardText,),
							Spacer(),
							Text("0", style: TextStyles.materialCardText,),
						],
					)
				],
			),
		);
	}

}