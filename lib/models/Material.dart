enum UE {
	INFO, GENERAL
}

class Material {

	final String name;
	final int totalHours;
	final int absences;
	final UE ue;
	int maxAbsences;

	Material({this.name, this.totalHours, this.absences, this.ue});

}