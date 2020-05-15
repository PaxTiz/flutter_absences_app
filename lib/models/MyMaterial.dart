class MyMaterial {
  final String name;
  final int totalHours;
  final int absences;
  final String ue;
  final int semester_id;
  int maxAbsences;

  MyMaterial(
      {this.name, this.totalHours, this.absences, this.ue, this.semester_id});

  Map<String, String> toMap() {
    return {
      'name': name,
      'totalHours': totalHours.toString(),
      'absences': absences.toString(),
      'ue': ue,
      'semester_id': semester_id.toString()
    };
  }
}
