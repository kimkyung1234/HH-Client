import 'dart:io';

import 'package:app/providers/providers.dart';
import 'package:app/services/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart';

class EditProfilePage extends StatelessWidget {
  final _name = TextEditingController();
  final _desc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<EditProfile>(context);
    var themeMode = Provider.of<ThemeChanger>(context);
    var theme = themeMode.getThemeData;

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Edit Profile',
          style:
              TextStyle(color: theme.accentColor, fontWeight: FontWeight.bold),
        ),
        leading: BackButton(color: theme.accentColor),
      ),
      body: Column(
        children: [
          Row(
            children: [
              provider.getImage == null
                  ? GestureDetector(
                      onTap: () {
                        provider.setImage();
                      },
                      child: Container(
                        height: 150,
                        width: 150,
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
                        height: 150,
                        width: 150,
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
              Flexible(
                child: Container(
                  margin: const EdgeInsets.only(right: 20),
                  child: TextField(
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
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                TextField(
                  controller: _desc,
                  cursorColor: theme.accentColor,
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                  style: TextStyle(color: theme.accentColor),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: theme.canvasColor,
                    hintText: 'Description',
                    hintStyle: TextStyle(color: theme.accentColor),
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
                const SizedBox(height: 20),
                CupertinoButton(
                  onPressed: () {
                    _name.text.isEmpty
                        ? provider.setNameValidate(true)
                        : provider.setNameValidate(false);

                    if (provider.getImage == null) {
                      postEditProfile(
                        name: _name.text,
                        image: '',
                        description: _desc.text,
                        context: context,
                      );
                    } else if (provider.getNameValidate == false) {
                      postEditProfile(
                        name: _name.text,
                        image: basename(provider.getImage!.path),
                        description: _desc.text,
                        context: context,
                      );
                    }
                  },
                  child: const Text('Save'),
                  color: Colors.black,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
