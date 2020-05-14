import 'package:absences/database.dart';
import 'package:absences/models/Semester.dart';
import 'package:sqflite/sqflite.dart';

class SemesterService {
  Future findAll() async {
    final Database db = await AbsencesDB.getInstance();
    final List<Map> list = await db.query('semesters');

    List<Semester> sms = [];
    list.forEach((element) {
      sms.add(Semester(id: element['id'], name: element['name']));
    });
    return sms;
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
