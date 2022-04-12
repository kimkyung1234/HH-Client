import 'dart:convert';
import 'dart:io';

import 'package:app/models/post.dart';
import 'package:app/models/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';

String baseUrl = 'http://{BASE_URL}';

Future<String> _loadAddressAsset(String location) async {
  return await rootBundle.loadString(location);
}

Future<Post> getPost(int index) async {
  // final response = await get(
  //     Uri.parse(baseUrl + '/posts?page=' + index.toString() + '&size=5'));
  // if (response.statusCode == 200) {
  //   return Post.fromJson(jsonDecode(response.body));
  // } else {
  //   throw Exception("Error loading");
  // }
  final response = await _loadAddressAsset('assets/posts.json');
  return Post.fromJson(jsonDecode(response));
}

Future<Profile> getProfile(String name) async {
  // final response = await get(Uri.parse(baseUrl + name + '/profile'));
  // if (response.statusCode == 200) {
  //   return Profile.fromJson(jsonDecode(response.body));
  // } else {
  //   throw Exception("Error loading");
  // }
  final response = await _loadAddressAsset('assets/profile.json');
  return Profile.fromJson(jsonDecode(response));
}

Future<Post> getMyPost(String name) async {
  // final response = await get(Uri.parse(baseUrl + name + '/posts'));
  // if (response.statusCode == 200) {
  //   return Post.fromJson(jsonDecode(response.body));
  // } else {
  //   throw Exception("Error loading");
  // }
  final response = await _loadAddressAsset('assets/my_post.json');
  return Post.fromJson(jsonDecode(response));
}

void postRequest(
    {required String title,
    required String image,
    required String content,
    required BuildContext context}) async {
  Response response = await post(
    Uri.parse(baseUrl + '/posts'),
    headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    },
    body: jsonEncode({
      'strTitle': title,
      'strImage': image,
      'strContent': content,
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
  Response response = await post(
    Uri.parse(baseUrl + name + '/profile'),
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
