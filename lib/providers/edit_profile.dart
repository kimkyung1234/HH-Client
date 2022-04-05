import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile with ChangeNotifier {
  final ImagePicker _picker = ImagePicker();
  PickedFile? _image;
  PickedFile? get getImage => _image;

  void setImage() async {
    PickedFile? image = await _picker.getImage(source: ImageSource.gallery);
    _image = image;
    notifyListeners();
  }

  bool _nameValidate = false;
  bool get getNameValidate => _nameValidate;

  void setNameValidate(bool nameValidate) {
    _nameValidate = nameValidate;
    notifyListeners();
  }

  void reset() async {
    _image = null;
    _nameValidate = false;
    notifyListeners();
  }
}
