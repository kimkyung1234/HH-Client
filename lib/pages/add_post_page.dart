import 'dart:io';

import 'package:app/providers/add_post.dart';
import 'package:app/services/api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart';

class AddPostPage extends StatelessWidget {
  final _name = TextEditingController();
  final _desc = TextEditingController();

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
                      decoration: BoxDecoration(
                        color: const Color(0xffDBDADA),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
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
                      margin: const EdgeInsets.all(20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.file(
                          File(provider.getImage!.path),
                          fit: BoxFit.cover,
                        ),
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
                    errorText: provider.getNameValidate
                        ? 'Name Can\'t Be Empty'
                        : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: _desc,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.multiline,
                  maxLines: 8,
                  decoration: InputDecoration(
                    hintText: 'Description*',
                    errorText: provider.getDescValidate
                        ? 'Name Can\'t Be Empty'
                        : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    _name.text.isEmpty
                        ? provider.setNameValidate(true)
                        : provider.setNameValidate(false);
                    _desc.text.isEmpty
                        ? provider.setDescValidate(true)
                        : provider.setDescValidate(false);

                    if (provider.getNameValidate == false ||
                        provider.getDescValidate == false ||
                        provider.getImage != null) {
                      postRequest(
                        _name.text,
                        basename(provider.getImage!.path),
                        _desc.text,
                      );
                    } else {}
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
