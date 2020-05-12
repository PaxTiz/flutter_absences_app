import 'package:absences/components/materials/MaterialCard.dart';
import 'package:absences/components/text/BigTitle.dart';
import 'package:flutter/cupertino.dart';

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
					BigTitle(text: "Semestre $id", size: 36, bold: true),
					/**
					 * MATIERES INFORMATIQUE
					 */
					BigTitle(text: "Matières informatique", size: 24,),
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

					/**
					 * MATIERES GENERALES
					 */
					SizedBox(height: 32,),
					BigTitle(text: "Matières générales", size: 24,),
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
