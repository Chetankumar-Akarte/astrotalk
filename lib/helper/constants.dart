import 'package:flutter/material.dart';

/// Route
const String routeHome = "/";
const String routeProfile = "/routeProfile";

/// asset icons
const String iconAsk = "assets/ask.png";
const String iconChat = "assets/chat.png";
const String iconHome = "assets/home.png";
const String iconLogo = "assets/icon.png";
const String iconProfile = "assets/profile.png";
const String iconQuiz = "assets/chat.png";
const String iconReport = "assets/reports.png";
const String iconTalk = "assets/talk.png";

class Constants {
  static String appName = "AstroTalk";

  // static Color lightPrimary = Colors.white;
  static Color? lightPrimary = Colors.amber[800];
  static Color darkPrimary = Colors.black;
  //static Color lightAccent = Color(0xff06d6a7);
  //static Color darkAccent = Color(0xff06d6a7);
  static Color lightAccent = Colors.red;
  static Color darkAccent = Colors.redAccent;
  static Color lightBG = const Color(0xFFFAFAFA);
  static Color darkBG = const Color(0xFF2C2C2C);
  static const Color greyColor = Colors.black38;


  static ThemeData lightTheme = ThemeData(
    fontFamily: "Poppins",
    backgroundColor: lightBG,
    primaryColor: lightPrimary,
    accentColor: lightAccent,
    cursorColor: lightAccent,
    scaffoldBackgroundColor: lightBG,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      textTheme: TextTheme(
        subtitle1: TextStyle(
          fontFamily: "Poppins",
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w800,
        ),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: "Poppins",
    brightness: Brightness.dark,
    backgroundColor: darkBG,
    primaryColor: darkPrimary,
    accentColor: darkAccent,
    scaffoldBackgroundColor: darkBG,
    cursorColor: darkAccent,
    appBarTheme: AppBarTheme(
      elevation: 0,
      textTheme: TextTheme(
        subtitle1: TextStyle(
          fontFamily: "Poppins",
          color: lightBG,
          fontSize: 20,
          fontWeight: FontWeight.w800,
        ),
      ),
    ),
  );

  static List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }
}
