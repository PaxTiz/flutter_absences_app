import 'package:flutter/material.dart';

abstract class CustomStyles {
  static TextStyle materialCardsHeadline = TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontFamily: "OpenSans");

  static TextStyle materialCardsBody =
      TextStyle(color: Colors.white, fontSize: 14, fontFamily: "OpenSans");

  static TextStyle button = TextStyle(
    fontSize: 18,
    fontFamily: "Montserrat",
  );

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: "Montserrat",
    textTheme: TextTheme(
        headline1: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        headline2: TextStyle(
          fontSize: 24,
          color: Colors.black,
        )),
    bottomAppBarColor: Colors.black,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: "Montserrat",
    textTheme: TextTheme(
      headline1: TextStyle(
          fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),
      headline2: TextStyle(
        fontSize: 24,
        color: Colors.white,
      ),
    ),
    bottomAppBarColor: Colors.white,
  );
}
