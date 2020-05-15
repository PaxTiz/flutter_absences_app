import 'package:sqflite/sqflite.dart';

import '../database.dart';
import '../models/MyMaterial.dart';

class MaterialService {
  /// Returns all materials
  Future findAll() async {
    final Database db = await AbsencesDB.getInstance();
    final List list = await db.query('materials');
    return _toMaterialsList(list) ?? [];
  }

  /// Returns all materials which has semester_id passed in parameters
  Future<List<MyMaterial>> findBySemesterId(int id) async {
    final Database db = await AbsencesDB.getInstance();
    final List list = await db.query('materials',
	    where: 'semester_id = ?', whereArgs: [id.toString()]);
    final List<MyMaterial> materials = _toMaterialsList(list);
    return (materials.length > 0) ? materials : [];
  }

  /// Returns material with id passed in parameters
  Future findById(int id) async {
	  final Database db = await AbsencesDB.getInstance();
	  final List list =
	  await db.query('materials', where: 'id = ?', whereArgs: [id]);
	  final materials = _toMaterialsList(list);
	  return (materials.length > 0) ? materials.first : [];
  }

  /// Insert a new material
  Future insertSemester(MyMaterial material) async {
    final Database db = await AbsencesDB.getInstance();
    await db.insert('materials', material.toMap());
  }

  /// Delete material with id passed in parameters
  Future deleteSemester(int id) async {
    final Database db = await AbsencesDB.getInstance();
    await db.delete('materials', where: 'id', whereArgs: [id]);
  }

  Future<int> findMaxId() async {
    final Database db = await AbsencesDB.getInstance();
    final map = await db.rawQuery('SELECT MAX(id) as maxId FROM materials');
    return map[0]['maxId'] ?? 0;
  }

  /// Convert a List<Map<String, dynamic>> to a List<Material>
  List<MyMaterial> _toMaterialsList(List<Map> map) {
	  List<MyMaterial> materials = [];
	  map.forEach((element) {
		  materials.add(
			  MyMaterial(
				  name: element['name'],
				  totalHours: element['totalHours'],
				  ue: element['ue'],
				  absences: element['absences'],
				  semester_id: element['semester_id']),
		  );
	  });
	  return materials;
  }
}
