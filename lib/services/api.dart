import 'dart:convert';

import 'package:app/models/post.dart';
import 'package:app/models/profile.dart';
import 'package:flutter/services.dart';

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
