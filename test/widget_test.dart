import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

void main() async {
  String imagePath = 'assets/image/test.png';

  File imageFile = File(imagePath);
  Uint8List imageBytes = await imageFile.readAsBytes();
  String base64string = base64.encode(imageBytes);
  print(base64string);
}
