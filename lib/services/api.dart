import 'dart:convert';
import 'dart:io';

import 'package:app/models/post.dart';
import 'package:app/models/profile.dart';
import 'package:app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';

Future<String> _loadAddressAsset(String location) async {
  return await rootBundle.loadString(location);
}

Future<Post> getList() async {
  final response = await _loadAddressAsset('assets/posts.json');
  return Post.fromJson(jsonDecode(response));
}

Future<Profile> getProfile() async {
  final response = await _loadAddressAsset('assets/profile.json');
  return Profile.fromJson(jsonDecode(response));
}

Future<Post> getMyPost() async {
  final response = await _loadAddressAsset('assets/my_post.json');
  return Post.fromJson(jsonDecode(response));
}

void postRequest(String text, String image, String description) async {
  String url = '';

  Response response = await post(
    Uri.parse(url),
    headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    },
    body: jsonEncode({
      'strText': text,
      'strImage': image,
      'strDescription': description,
    }),
  );
}

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
