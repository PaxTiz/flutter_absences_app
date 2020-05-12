import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class BigTitle extends StatelessWidget {

	final String text;
	final double size;
	final bool bold;
	const BigTitle({@required this.text, @required this.size, this.bold = false});

	@override
	Widget build(BuildContext context) {
		return Text(
			text,
			style: GoogleFonts.montserrat(
				fontSize: size,
				fontWeight: bold ? FontWeight.bold : FontWeight.normal
			),
		);
	}

}