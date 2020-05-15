import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AbsencesDB {
  static Future<Database> instance;

  static Future<Database> getInstance() async {
    if (instance == null) {
      instance = openDatabase(join(await getDatabasesPath(), 'absences.db'),
          onCreate: (db, version) {
              db.execute(
                  "CREATE TABLE semesters(id INTEGER PRIMARY KEY, name TEXT NOT NULL)");
              db.execute("""
              CREATE TABLE materials(
                id INTEGER PRIMARY KEY, 
                name TEXT NOT NULL, 
                totalHours INT NOT NULL, 
                absences INT NOT NULL DEFAULT 0, 
                ue TEXT CHECK(ue IN ('Informatique','Général')), 
                semester_id INT NOT NULL
              )
            """);
          }, singleInstance: true, version: 1);
    }

    return instance;
  }
}
