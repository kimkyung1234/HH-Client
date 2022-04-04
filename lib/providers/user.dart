import 'package:flutter/material.dart';

class UserName with ChangeNotifier {
  String? _userName;
  String? get getUserName => _userName;

  void setUserName(String userName) {
    _userName = userName;
    notifyListeners();
  }
}
