import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/MaterialGrid.dart';

class SemesterView extends StatefulWidget {
	final int id;

	SemesterView(this.id);

	createState() => SemesterViewState();
}

class SemesterViewState extends State<SemesterView> {


	List<Material> materials = [];

	@override
	void initState() {
		super.initState();
	}

	@override
	Widget build(BuildContext context) {
		return Padding(
			padding: EdgeInsets.symmetric(horizontal: 16),
			child: ListView(
				children: <Widget>[
					SizedBox(height: 16,),
					Text("Semestre " + widget.id.toString(), style: Theme
						.of(context)
						.textTheme
						.headline1,),

					Text("Matières informatique", style: Theme
						.of(context)
						.textTheme
						.headline2,),
					SizedBox(height: 8,),
					MaterialGrid(),

					SizedBox(height: 32,),
					Text("Matières générales", style: Theme
						.of(context)
						.textTheme
						.headline2,),
					SizedBox(height: 8,),
					MaterialGrid(),
				],
			),
		);
	}

}
