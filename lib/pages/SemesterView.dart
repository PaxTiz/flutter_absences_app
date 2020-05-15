import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/MaterialGrid.dart';
import '../models/MyMaterial.dart';
import '../services/MaterialService.dart';

class SemesterView extends StatefulWidget {
  final int id;

  SemesterView(this.id);

  createState() => SemesterViewState();
}

class SemesterViewState extends State<SemesterView> {
	MaterialService service = MaterialService();
	List<List<MyMaterial>> materials = [];

	@override
	void initState() {
		super.initState();
		service.findBySemesterId(widget.id).then((value) =>
			setState(() {
				if (value.length > 0) _groupByUE(value);
			}));
	}

	void _groupByUE(List<MyMaterial> m) {
		List<MyMaterial> info = [];
		List<MyMaterial> gen = [];
		m.forEach((element) {
			if (element.ue == "Général") {
				gen.add(element);
			} else {
				info.add(element);
			}
		});
		setState(() {
			materials = [info, gen];
		});
	}

	Widget _buildUI(BuildContext context) {
		return materials.length > 0 ? _buildGridView() : _buildEmptyView(
			context);
	}

	Widget _buildGridView() {
		return Column(
			crossAxisAlignment: CrossAxisAlignment.start,
			children: <Widget>[
				Text(
					"Matières informatique",
					style: Theme
						.of(context)
						.textTheme
						.headline2,
				),
				SizedBox(
					height: 8,
				),
				MaterialGrid(
					materials: materials[0],
				),
				SizedBox(
					height: 32,
				),
				Text(
					"Matières générales",
					style: Theme
						.of(context)
						.textTheme
						.headline2,
				),
				SizedBox(
					height: 8,
				),
				MaterialGrid(
					materials: materials[1],
				),
			],
		);
	}

	Widget _buildEmptyView(BuildContext context) {
		return Text(
			"Aucune matière pour le semestre " + widget.id.toString(),
			style: Theme
				.of(context)
				.textTheme
				.headline2,
		);
	}

	@override
	Widget build(BuildContext context) {
		return Padding(
			padding: EdgeInsets.symmetric(horizontal: 16),
			child: ListView(
				children: <Widget>[
					SizedBox(
						height: 16,
					),
					Text(
						"Semestre " + widget.id.toString(),
						style: Theme
							.of(context)
							.textTheme
							.headline1,
					),
					_buildUI(context),
				],
			),
		);
	}
}
