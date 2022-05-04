import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:app/models/post.dart';
import 'package:app/models/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

String baseUrl = 'http://3.39.135.189:8080';

Future<String> _loadAddressAsset(String location) async {
  return await rootBundle.loadString(location);
}

Future<Post> getPost(int index) async {
  final response = await get(
      Uri.parse(baseUrl + '/posts?page=' + index.toString() + '&size=5'));
  if (response.statusCode == 200) {
    return Post.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Error loading");
  }
  // final response = await _loadAddressAsset('assets/posts.json');
  // return Post.fromJson(jsonDecode(response));
}

Future<Profile> getProfile() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  final response = await get(
    Uri.parse(baseUrl + '/user/profile'),
    headers: {
      'Authorization': 'Bearer ' + sharedPreferences.getString('accessToken')!
    },
  );
  if (response.statusCode == 200) {
    return Profile.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Error loading');
  }
  // final response = await _loadAddressAsset('assets/profile.json');
  // return Profile.fromJson(jsonDecode(response));
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

Future<void> postRequest(
    {required String title,
    required PickedFile image,
    required String content,
    required BuildContext context}) async {
  Uint8List bytes = await image.readAsBytes();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  Response response = await post(
    Uri.parse(baseUrl + '/posts'),
    headers: {
      'Authorization': 'Bearer ' + sharedPreferences.getString('accessToken')!
    },
    body: {
      'strTitle': title,
      'image': bytes,
      'strContent': content,
    },
  );

  if (response.statusCode == 200) {
    Navigator.pop(context);
  } else {
    var snackBar = const SnackBar(content: Text('Something Wrong'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

Future<void> postEditProfile(
    {required String name,
    required PickedFile image,
    required String description,
    required BuildContext context}) async {
  Uint8List bytes = await image.readAsBytes();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  Response response = await post(
    Uri.parse(baseUrl + name + '/profile'),
    headers: {
      HttpHeaders.authorizationHeader:
          sharedPreferences.getString('accessToken')!,
    },
    body: {
      'strName': name,
      'strImage': bytes,
      'strDescription': description,
    },
  );

  if (response.statusCode == 200) {
    Navigator.pop(context);
  } else {
    var snackBar = const SnackBar(content: Text('Something Wrong'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
