import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPost with ChangeNotifier {
  final ImagePicker _picker = ImagePicker();
  PickedFile? _image;
  PickedFile? get getImage => _image;

  void setImage() async {
    PickedFile? image = await _picker.getImage(source: ImageSource.gallery);
    _image = image;
    notifyListeners();
  }

  bool _validate = false;
  bool get getValidate => _validate;
  String? _name;
  String? get getName => _name;

  void setValidate(bool validate) {
    _validate = validate;
    notifyListeners();
  }

  void setName(String name) {
    _name = name;
    notifyListeners();
  }

  void reset() async {
    _image = null;
    _name = null;
    notifyListeners();
  }
}
