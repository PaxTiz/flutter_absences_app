class Semester {

	final int id;
	final String name;

	const Semester({this.id, this.name});

	Map<String, dynamic> toMap() {
		return {
			'id': id,
			'name': name
		};
	}

}