import 'package:app/models/post.dart';
import 'package:app/services/api.dart';
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

  /// list lazy loading

  List<dynamic> _postList = [];
  List<dynamic> get getPostList => _postList;

  bool _isFirstLoadRunning = true;

  Future<void> firstLoad() async {
    if (_isFirstLoadRunning == true) {
      var a = await getPost(1);
      _postList = a.posts!;

      _isFirstLoadRunning = false;
    }
  }

  Future<void> loadMore() async {
    if (_isFirstLoadRunning == false) {
      var a = await getPost(1);
      _postList.addAll(a.posts!);
      notifyListeners();
    }
  }
}
