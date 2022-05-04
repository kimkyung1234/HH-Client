import 'dart:convert';
import 'dart:io';

import 'package:app/pages/pages.dart';
import 'package:app/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

String baseUrl = 'http://3.39.135.189:8080';

Future<void> signIn(
    {required String id,
    required String password,
    required BuildContext context}) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var data = jsonEncode({
    'userId': id,
    'password': password,
  });
  var jsonResponse;
  var response = await post(
    Uri.parse(baseUrl + '/user/login'),
    headers: {'Content-type': 'application/json'},
    body: data,
  );
  var provider = Provider.of<UserName>(context, listen: false);

  if (response.statusCode == 201) {
    jsonResponse = json.decode(response.body);
    if (jsonResponse != null) {
      sharedPreferences.setString('accessToken', jsonResponse['accessToken']);

      String userName = jsonResponse['userName'];
      // print(userName);
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

Future<void> signUp(
    {required String user,
    required String email,
    required String password,
    required BuildContext context}) async {
  var jsonResponse;
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  Response response = await post(
    Uri.parse(baseUrl + '/user/join'),
    headers: {'Content-type': 'application/json'},
    body: jsonEncode({
      'userName': user,
      'userId': email,
      'password': password,
      'email': email,
      'zipCode': 1
    }),
  );
  var provider = Provider.of<UserName>(context, listen: false);

  if (response.statusCode == 201) {
    jsonResponse = json.decode(response.body);
    if (jsonResponse != null) {
      sharedPreferences.setString('accessToken', jsonResponse['accessToken']);

      String userName = jsonResponse['userName'];
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

Future<void> postEmailCode(
    {required String emailCode, required BuildContext context}) async {
  var jsonResponse;
  Response response = await post(
    Uri.parse(baseUrl + '/email'),
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
