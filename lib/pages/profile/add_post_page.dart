import 'dart:io';

import 'package:app/providers/providers.dart';
import 'package:app/services/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

class AddPostPage extends StatelessWidget {
  final _name = TextEditingController();
  final _desc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AddPost>(context);
    var themeMode = Provider.of<ThemeChanger>(context);
    var theme = themeMode.getThemeData;

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'New Post',
          style:
              TextStyle(color: theme.accentColor, fontWeight: FontWeight.bold),
        ),
        leading: BackButton(color: theme.accentColor),
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
                        color: theme.canvasColor,
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
                  cursorColor: theme.accentColor,
                  style: TextStyle(color: theme.accentColor),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: theme.canvasColor,
                    hintText: 'Name*',
                    hintStyle: TextStyle(color: theme.accentColor),
                    errorText: provider.getNameValidate
                        ? 'Name Can\'t Be Empty'
                        : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: theme.primaryColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: theme.accentColor),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: _desc,
                  cursorColor: theme.accentColor,
                  keyboardType: TextInputType.multiline,
                  maxLines: 8,
                  style: TextStyle(color: theme.accentColor),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: theme.canvasColor,
                    hintText: 'Description*',
                    hintStyle: TextStyle(color: theme.accentColor),
                    errorText: provider.getDescValidate
                        ? 'Name Can\'t Be Empty'
                        : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: theme.primaryColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: theme.accentColor),
                    ),
                  ),
                ),
                const SizedBox(height: 23),
                CupertinoButton(
                  onPressed: () {
                    _name.text.isEmpty
                        ? provider.setNameValidate(true)
                        : provider.setNameValidate(false);
                    _desc.text.isEmpty
                        ? provider.setDescValidate(true)
                        : provider.setDescValidate(false);

                    if (provider.getImage == null) {
                      var snackBar =
                          const SnackBar(content: Text('Please select image'));

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else if (provider.getNameValidate == false ||
                        provider.getDescValidate == false) {
                      postRequest(
                          title: _name.text,
                          image: basename(provider.getImage!.path),
                          content: _desc.text,
                          context: context);
                    }
                  },
                  child: const Text('Submit'),
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
