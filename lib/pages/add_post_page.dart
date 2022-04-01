import 'dart:io';

import 'package:app/providers/add_post.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddPostPage extends StatelessWidget {
  final _name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AddPost>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text(
          'New Post',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: const BackButton(color: Colors.black),
      ),
      body: ListView(
        children: [
          Center(
            child: provider.getImage == null
                ? GestureDetector(
                    onTap: () {
                      provider.setImage();
                    },
                    child: Container(
                      height: 350,
                      color: const Color(0xffDBDADA),
                      margin: const EdgeInsets.all(20),
                      child: const Center(
                        child: Icon(
                          Icons.add_photo_alternate,
                          color: Color(0xff949494),
                        ),
                      ),
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      provider.setImage();
                    },
                    child: Container(
                      height: 350,
                      color: const Color(0xffDBDADA),
                      margin: const EdgeInsets.all(20),
                      child: Image.file(
                        File(provider.getImage!.path),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                TextField(
                  controller: _name,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: 'Name*',
                    errorText:
                        provider.getValidate ? 'Name Can\'t Be Empty' : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    _name.text.isEmpty
                        ? provider.setValidate(true)
                        : provider.setValidate(false);
                    provider.setName(_name.text);
                  },
                  child: const Text('Submit'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
