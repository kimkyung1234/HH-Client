import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _themeDark = false;
  bool get getThemeDark => _themeDark;

  void setLight() {
    _themeDark = false;
    notifyListeners();
  }

  void setDark() {
    _themeDark = true;
    notifyListeners();
  }

  ThemeData get getThemeData => !_themeDark ? lightTheme : darkTheme;
}

final darkTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  backgroundColor: const Color(0xff222427),
  accentColor: Colors.white,
  accentIconTheme: const IconThemeData(color: Colors.black),
  dividerColor: Colors.black54,
);

final lightTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.white,
  brightness: Brightness.light,
  backgroundColor: const Color(0xffFAF9F9),
  accentColor: Colors.black,
  accentIconTheme: const IconThemeData(color: Colors.white),
  dividerColor: Colors.white54,
);
