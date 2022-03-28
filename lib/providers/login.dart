import 'package:flutter/foundation.dart';

class LoginHelper with ChangeNotifier {
  bool invisible = true;
  bool get getVisible => invisible;

  void setInvisible() {
    invisible = true;
    notifyListeners();
  }

  void setvisible() {
    invisible = false;
    notifyListeners();
  }
}
