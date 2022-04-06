import 'dart:convert';
import 'dart:io';

import 'package:app/pages/pages.dart';
import 'package:app/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

void signIn(
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

void signUp(
    {required String user,
    required String email,
    required String password,
    required BuildContext context}) async {
  String url = '';

  var jsonResponse;
  Response response = await post(
    Uri.parse(url),
    headers: {'Content-type': 'application/json'},
    body: jsonEncode({'user_name': user, 'id': email, 'password': password}),
  );

  var provider = Provider.of<UserName>(context);

  if (response.statusCode == 200) {
    jsonResponse = json.decode(response.body);
    if (jsonResponse != null) {
      String userName = jsonResponse['user_name'];
      provider.setUserName(userName);

      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    }
  } else {
    var snackBar = const SnackBar(content: Text('Something Wrong'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

void postEmailCode(
    {required String emailCode, required BuildContext context}) async {
  String url = '';

  var jsonResponse;
  Response response = await post(
    Uri.parse(url),
    headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    body: jsonEncode({'email_code': emailCode}),
  );

  var provider = Provider.of<UserName>(context);

  if (response.statusCode == 200) {
    jsonResponse = json.decode(response.body);
    if (jsonResponse != null) {
      String userName = jsonResponse['user_name'];
      provider.setUserName(userName);

      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    }
  } else {
    var snackBar = const SnackBar(content: Text('Something Wrong'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
