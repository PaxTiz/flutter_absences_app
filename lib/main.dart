import 'package:absences/pages/MaterialCreate.dart';
import 'package:absences/styles.dart';
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
			theme: CustomStyles.lightTheme,
			darkTheme: CustomStyles.darkTheme,
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

	List<BottomNavigationBarItem> createNavItems(BuildContext context) {
		List<BottomNavigationBarItem> navItems = [];
		for (int i = 1; i < semesters.length + 1; i++) {
			IconData icon;
			if (i == 1)
				icon = Icons.filter_1;
			else if (i == 2)
				icon = Icons.filter_2;
			else if (i == 3)
				icon = Icons.filter_3;
			else if (i == 4) icon = Icons.filter_4;

			navItems.add(BottomNavigationBarItem(
				icon: Icon(icon, color: Theme
					.of(context)
					.bottomAppBarColor),
				title: Text(
					"Semestre $i",
					style: TextStyle(color: Theme
						.of(context)
						.bottomAppBarColor),
				)));
		}

		return navItems;
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
							Navigator.push(context,
								MaterialPageRoute(
									builder: (context) => MaterialCreate()));
						},
						icon: Icon(CupertinoIcons.add_circled),
					)
				],
			),
			bottomNavigationBar: BottomNavigationBar(
				currentIndex: _currentIndex,
				onTap: setIndex,
				items: createNavItems(context),
			),
		);
	}
}
