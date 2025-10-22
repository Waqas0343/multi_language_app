import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData.light().copyWith(
    colorScheme:  ColorScheme.light(
      primary: Color(0xFF3876F2),
      secondary: Color(0xFF146EB4),
    ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme:  AppBarTheme(
      backgroundColor: Color(0xFF3876F2),
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      iconTheme: IconThemeData(color: Colors.white),
    ),
  );

  static final darkTheme = ThemeData.dark().copyWith(
    colorScheme:  ColorScheme.dark(
      primary: Color(0xFF3876F2),
      secondary: Color(0xFF146EB4),
    ),
    scaffoldBackgroundColor:  Color(0xFF121212),
    appBarTheme:  AppBarTheme(
      backgroundColor: Color(0xFF1E1E1E),
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      iconTheme: IconThemeData(color: Colors.white),
    ),
  );
}
