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

  bool _nameValidate = false;
  bool get getNameValidate => _nameValidate;
  bool _descValidate = false;
  bool get getDescValidate => _descValidate;
  String? _name;
  String? get getName => _name;
  String? _desc;
  String? get getDesc => _desc;

  void setNameValidate(bool nameValidate) {
    _nameValidate = nameValidate;
    notifyListeners();
  }

  void setDescValidate(bool descValidate) {
    _descValidate = descValidate;
    notifyListeners();
  }

  void setName(String name) {
    _name = name;
    notifyListeners();
  }

  void setDesc(String desc) {
    _desc = desc;
    notifyListeners();
  }

  void reset() async {
    _image = null;
    _name = null;
    _desc = null;
    _descValidate = false;
    _nameValidate = false;
    notifyListeners();
  }
}
