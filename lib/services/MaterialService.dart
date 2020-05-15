import 'package:absences/database.dart';
import 'package:absences/models/Material.dart';
import 'package:absences/models/Semester.dart';
import 'package:sqflite/sqflite.dart';

class MaterialService {
  Future findAll() async {
    final Database db = await AbsencesDB.getInstance();
    final List<Map> list = await db.query('materials');

    List<Semester> sms = [];
    list.forEach((element) {
      sms.add(Semester(id: element['id'], name: element['name']));
    });
    return sms;
  }

  Future find(int id) async {
    final Database db = await AbsencesDB.getInstance();
    final List<Map> list =
        await db.query('materials', where: 'semester_id = ?', whereArgs: [id]);

    List<Material> materials = [];
    list.forEach((element) {
      materials.add(Material(
          name: element['name'],
          totalHours: element['totalHours'],
          ue: element['ue'],
          absences: element['absences']));
    });
    return materials;
  }

  Future insertSemester() async {
    final Database db = await AbsencesDB.getInstance();
    final id = await findMaxId() + 1;
    Semester semester = Semester(id: id, name: "Semestre " + id.toString());

    await db.insert('semesters', semester.toMap());
  }

  Future deleteSemester() async {
    final Database db = await AbsencesDB.getInstance();
    final id = await findMaxId();
    await db.delete('semesters', where: 'id', whereArgs: [id]);
  }

  Future<int> findMaxId() async {
    final Database db = await AbsencesDB.getInstance();
    final map = await db.rawQuery('SELECT MAX(id) as maxId FROM semesters');
    return map[0]['maxId'] ?? 0;
  }
}
