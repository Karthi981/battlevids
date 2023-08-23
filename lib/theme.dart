import 'package:flutter/material.dart';

class ThemeNotifier with ChangeNotifier {
  ThemeData _currentTheme = AppTheme.lightTheme;

  ThemeData get currentTheme => _currentTheme;

  void toggleTheme() {
    _currentTheme =
    (_currentTheme == AppTheme.lightTheme) ? AppTheme.darkTheme : AppTheme.lightTheme;
    notifyListeners();
  }
}
class AppTheme {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xff939fbb),
    colorScheme:ColorScheme.light(
      brightness: Brightness.light,
      primary: Color(0xffa7b8d7),
      secondary: Color(0xff7d94be),
      tertiary: Color(0xff8a0505),
    ),
    appBarTheme: AppBarTheme(
      color: Color(0xff111213),
    ),
    buttonTheme: ButtonThemeData(
        colorScheme: ColorScheme.light(
          primary: Colors.black,
          secondary: Color(0xffb7c2d7),
          tertiary: Colors.black,
        )
    ),
    // Define other theme properties like text styles, etc.
  );

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    colorScheme:ColorScheme.dark(
      brightness: Brightness.dark,
      primary: Colors.black,
      secondary: Color(0xff0f1b33),
      tertiary: Colors.black,
    ),
    buttonTheme: ButtonThemeData(
      colorScheme: ColorScheme.light(
        primary: Colors.blueAccent,
        secondary: Color(0xff0f1b33),
        tertiary: Colors.black,
      )
    ),
    appBarTheme: AppBarTheme(
      color: Colors.black,
    ),
    // Define other theme properties like text styles, etc.
  );
}
