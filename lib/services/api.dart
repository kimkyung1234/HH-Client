import 'dart:convert';

import 'package:app/models/post.dart';
import 'package:flutter/services.dart';

Future<String> _loadAddressAsset() async {
  return await rootBundle.loadString('assets/posts.json');
}

Future<Post> getList() async {
  final response = await _loadAddressAsset();
  return Post.fromJson(jsonDecode(response));
}
