import 'package:absences/models/Semester.dart';
import 'package:absences/pages/SemesterView.dart';
import 'package:absences/services/SemestersService.dart';
import 'package:absences/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MaterialForm extends StatefulWidget {
	final int id;

	MaterialForm({@required this.id});

	createState() => MaterialFormState();
}

class MaterialFormState extends State<MaterialForm> {
	final List<String> ues = ["Informatique", "Général"];
	String ueValue = "Informatique";

	SemesterService semesterService = SemesterService();
	Semester semesterValue = Semester(id: 0, name: "Semestre 0");
	List<Semester> semestersDropdown = [];

	@override
	void initState() {
		super.initState();
		semesterService.findAll().then((value) {
			setState(() {
				semestersDropdown = value;
			});
		});
	}

	void sendForm() {}

	void addSemester(BuildContext context) async {
		await semesterService.insertSemester();
		Navigator.push(context,
			MaterialPageRoute(builder: (context) => SemesterView(widget.id)));
	}

	void deleteSemester(BuildContext context) async {
		await semesterService.deleteSemester();
	}

	Widget dropdownItems() {
		if (semestersDropdown.length > 0) {
			return DropdownButton<Semester>(
				value: semestersDropdown.first,
				isExpanded: true,
				items: semestersDropdown.map((e) =>
					DropdownMenuItem<Semester>(
						value: e,
						child: Text(e.name),
					)).toList(),
				onChanged: (item) {
					setState(() {
						semesterValue = item;
					});
				},
			);
		}

		return Text("Please add a semestre before add material");
	}

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
								border: OutlineInputBorder(),
								labelText: "Nom de la matière"),
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
								.map((ue) =>
								DropdownMenuItem(
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
							padding: EdgeInsets.symmetric(
								horizontal: 32, vertical: 8),
							onPressed: () => sendForm(),
							child: Text(
								"Ajouter",
								style: CustomStyles.button,
							),
						),
						Spacer(),
						Row(
							mainAxisSize: MainAxisSize.max,
							mainAxisAlignment: MainAxisAlignment.spaceBetween,
							children: <Widget>[
								Container(
									child: CupertinoButton(
										color: Colors.blue,
										padding: EdgeInsets.symmetric(
											horizontal: 32, vertical: 8),
										onPressed: () => addSemester(context),
										child: Row(
											mainAxisAlignment: MainAxisAlignment
												.center,
											children: <Widget>[
												Icon(Icons.add),
												Text(
													"Nouveau",
													style: CustomStyles.button,
												)
											],
										),
									),
								),
								Container(
									child: CupertinoButton(
										color: Colors.blue,
										padding: EdgeInsets.symmetric(
											horizontal: 32, vertical: 8),
										onPressed: () =>
											deleteSemester(context),
										child: Row(
											mainAxisAlignment: MainAxisAlignment
												.center,
											children: <Widget>[
												Icon(Icons.add),
												Text(
													"Enlever",
													style: CustomStyles.button,
												)
											],
										),
									),
								)
							],
						)
					],
				),
			),
		);
	}
}
