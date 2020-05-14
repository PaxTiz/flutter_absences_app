import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AbsencesDB {
  static Future<Database> instance;

  static Future<Database> getInstance() async {
    if (instance == null) {
      instance = openDatabase(join(await getDatabasesPath(), 'absences.db'),
          onCreate: (db, version) {
        return db.execute(
            "CREATE TABLE semesters(id INTEGER PRIMARY KEY, name TEXT NOT NULL)");
      }, singleInstance: true, version: 1);
    }

    return instance;
  }
}
