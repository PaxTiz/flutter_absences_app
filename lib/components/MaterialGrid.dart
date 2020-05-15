import 'package:flutter/cupertino.dart';

import '../models/MyMaterial.dart';
import 'MaterialCard.dart';

class MaterialGrid extends StatelessWidget {
  final double gridGap = 8;
  final int gridItemsCount = 2;
  final List<MyMaterial> materials;

  MaterialGrid({this.materials});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GridView.count(
        shrinkWrap: true,
        primary: false,
        mainAxisSpacing: gridGap,
        crossAxisSpacing: gridGap,
        crossAxisCount: gridItemsCount,
        childAspectRatio: MediaQuery.of(context).size.width / 180,
        children: materials.map((e) => MaterialCard(material: e)).toList(),
      ),
    );
  }
}
