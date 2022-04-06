import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Pages with ChangeNotifier {
  int _currentIndex = 0;

  int get getCurrentIndex => _currentIndex;

  void onTabTapped(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  bool _gridSort = false;
  bool get getGridSort => _gridSort;

  Future<void> sort() async {
    final prefs = await SharedPreferences.getInstance();
    _gridSort = prefs.getBool('sort') ?? false;
  }

  void changeSort(bool gridSort) {
    _gridSort = gridSort;
    notifyListeners();
  }
}
