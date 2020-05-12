enum UE {
	INFO, GENERAL
}

class Material {

	final String name;
	final int totalHours;
	final int maxAbsences;
	final int absences;
	final UE ue;

  Material({this.name, this.totalHours, this.maxAbsences, this.absences, this.ue});

}