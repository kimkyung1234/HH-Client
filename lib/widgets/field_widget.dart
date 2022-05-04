import 'package:flutter/material.dart';

Widget FieldWidget({
  required String labelText,
  required TextEditingController controller,
  String? errorText,
  Widget? suffixIcon,
}) {
  return TextField(
    controller: controller,
    cursorColor: Colors.black,
    decoration: InputDecoration(
      labelText: labelText,
      errorText: errorText,
      labelStyle: const TextStyle(color: Colors.black),
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: const BorderSide(color: Colors.black),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black, width: 2.0),
        borderRadius: BorderRadius.circular(25.0),
      ),
      suffixIcon: suffixIcon,
    ),
  );
}
