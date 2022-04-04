import 'dart:convert';

import 'package:app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

signIn(
    {required String id,
    required String password,
    required BuildContext context}) async {
  var data = jsonEncode({'id': id, 'password': password});
  var jsonResponse;
  var response = await post(
    Uri.parse(''),
    headers: {'Content-type': 'application/json'},
    body: data,
  );

  if (response.statusCode == 200) {
    jsonResponse = json.decode(response.body);
    if (jsonResponse != null) {
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    }
  }
}

signUp(
    {required String user,
    required String email,
    required String password,
    required BuildContext context}) async {
  var data = jsonEncode({'user_name': user, 'id': email, 'password': password});
  var jsonResponse;
  var response = await post(
    Uri.parse(''),
    headers: {'Content-type': 'application/json'},
    body: data,
  );

  if (response.statusCode == 200) {
    jsonResponse = json.decode(response.body);
    if (jsonResponse != null) {
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    }
  }
}
