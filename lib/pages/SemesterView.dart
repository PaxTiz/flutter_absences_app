import 'package:absences/components/MaterialCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SemesterView extends StatelessWidget {

	final int id;
	final double gridGap = 8;
	final int gridItemsCount = 2;
	const SemesterView(this.id);

	@override
	Widget build(BuildContext context) {
		return Padding(
			padding: EdgeInsets.symmetric(horizontal: 16),
			child: ListView(
				children: <Widget>[
					SizedBox(height: 16,),
					Text("Semestre $id", style: Theme
						.of(context)
						.textTheme
						.headline1,),

					Text("Matières informatique", style: Theme
						.of(context)
						.textTheme
						.headline2,),
					SizedBox(height: 8,),
					SingleChildScrollView(
						child: GridView.count(
							shrinkWrap: true,
							primary: false,
							mainAxisSpacing: gridGap,
							crossAxisSpacing: gridGap,
							crossAxisCount: gridItemsCount,
							childAspectRatio: MediaQuery.of(context).size.width / 180,
							children: <Widget>[
								MaterialCard(),
								MaterialCard(),
								MaterialCard(),
								MaterialCard(),
							],
						),
					),

					SizedBox(height: 32,),
					Text("Matières générales", style: Theme
						.of(context)
						.textTheme
						.headline2,),
					SizedBox(height: 8,),
					SingleChildScrollView(
						child: GridView.count(
							shrinkWrap: true,
							primary: false,
							mainAxisSpacing: gridGap,
							crossAxisSpacing: gridGap,
							crossAxisCount: gridItemsCount,
							childAspectRatio: MediaQuery.of(context).size.width / 180,
							children: <Widget>[
								MaterialCard(),
								MaterialCard(),
								MaterialCard(),
								MaterialCard(),
							],
						),
					),
				],
			),
		);
	}

}
