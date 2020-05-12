import 'package:absences/pages/materials/MaterialCreate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'pages/SemesterView.dart';

void main() {
	runApp(MyApp());
}

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Flutter Demo',
			home: Absences(),
		);
	}
}

class Absences extends StatefulWidget {
	createState() => AbsencesState();
}

class AbsencesState extends State<Absences> {

	int _currentIndex = 0;

	final List<SemesterView> semesters = [
		SemesterView(1),
		SemesterView(2),
		SemesterView(3),
		SemesterView(4),
	];


	AbsencesState() {
		createNavItems();
	}

	final List<BottomNavigationBarItem> navItems = [];

	void createNavItems() {
		for(int i = 1; i < semesters.length + 1; i++) {
			IconData icon;
			switch(i) {
				case 1:
					icon = Icons.filter_1;
					break;
				case 2:
					icon = Icons.filter_2;
					break;
				case 3:
					icon = Icons.filter_3;
					break;
				case 4:
					icon = Icons.filter_4;
					break;
			}
			navItems.add(BottomNavigationBarItem(
				icon: Icon(icon, color: Colors.black,),
				title: Text("Semestre $i", style: TextStyle(color: Colors.black),)
			));
		}
	}

	void setIndex(int index) {
		setState(() {
		  _currentIndex = index;
		});
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: semesters[_currentIndex],
			appBar: AppBar(
				title: Text("Gestion des absences"),
				actions: <Widget>[
					IconButton(
						onPressed: () {
							Navigator.push(
								context,
								MaterialPageRoute(
									builder: (context) => MaterialCreate()
								)
							);
						},
						icon: Icon(CupertinoIcons.add_circled),
					)
				],
			),
			bottomNavigationBar: BottomNavigationBar(
				currentIndex: _currentIndex,
				onTap: setIndex,
				items: navItems,
			),
		);
	}

}