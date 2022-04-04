import 'package:flutter/foundation.dart';

class LoginHelper with ChangeNotifier {
  bool invisible = true;
  bool get getVisible => invisible;

  bool? _isLoading;
  bool? get getIsLoading => _isLoading;

  void setInvisible() {
    invisible = true;
    notifyListeners();
  }

  void setvisible() {
    invisible = false;
    notifyListeners();
  }

  bool _userValidate = false;
  bool get getUserValidate => _userValidate;
  bool _emailValidate = false;
  bool get getEmailValidate => _emailValidate;
  bool _passwordValidate = false;
  bool get getPasswordValidate => _passwordValidate;

  void setUserValidate(bool userValidate) {
    _userValidate = userValidate;
    notifyListeners();
  }

  void setEmailValidate(bool emailVaildate) {
    _emailValidate = emailVaildate;
    notifyListeners();
  }

  void setPasswordValidate(bool passwordValidate) {
    _passwordValidate = passwordValidate;
    notifyListeners();
  }

  void reset() async {
    _userValidate = false;
    _emailValidate = false;
    _passwordValidate = false;
    notifyListeners();
  }
}
