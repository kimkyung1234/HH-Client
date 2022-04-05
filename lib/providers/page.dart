import 'package:flutter/material.dart';

class Pages with ChangeNotifier {
  int _currentIndex = 0;

  int get getCurrentIndex => _currentIndex;

  void onTabTapped(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  bool _gridSort = false;
  bool get getGridSort => _gridSort;

  void changeSort(bool gridSort) {
    _gridSort = gridSort;
    notifyListeners();
  }
}
