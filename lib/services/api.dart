import 'dart:convert';
import 'dart:io';

import 'package:app/models/post.dart';
import 'package:app/models/profile.dart';
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

void postRequest(
    {required String text,
    required String image,
    required String description,
    required BuildContext context}) async {
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

  if (response.statusCode == 200) {
    Navigator.pop(context);
  } else {
    var snackBar = const SnackBar(content: Text('Something Wrong'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

void postEditProfile(
    {required String name,
    required String image,
    required String description,
    required BuildContext context}) async {
  String url = '';

  Response response = await post(
    Uri.parse(url),
    headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    },
    body: jsonEncode({
      'strName': name,
      'strImage': image,
      'strDescription': description,
    }),
  );

  if (response.statusCode == 200) {
    Navigator.pop(context);
  } else {
    var snackBar = const SnackBar(content: Text('Something Wrong'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
