import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  Future<void> theme() async {
    final prefs = await SharedPreferences.getInstance();
    _themeDark = prefs.getBool('theme') ?? false;
  }

  ThemeData get getThemeData => !_themeDark ? lightTheme : darkTheme;
}

final darkTheme = ThemeData(
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  backgroundColor: const Color(0xff222427),
  accentColor: Colors.white,
  canvasColor: const Color(0xff373B3E),
  splashColor: const Color(0xff373B3E),
);

final lightTheme = ThemeData(
  primaryColor: Colors.white,
  brightness: Brightness.light,
  backgroundColor: const Color(0xffFAF9F9),
  accentColor: Colors.black,
  canvasColor: const Color(0xffEEEEEE),
  splashColor: Colors.black,
);
