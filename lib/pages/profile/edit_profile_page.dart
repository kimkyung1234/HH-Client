import 'dart:io';

import 'package:app/providers/edit_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<EditProfile>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: const BackButton(color: Colors.black),
      ),
      body: ListView(
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
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintText: 'Name*',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            margin: EdgeInsets.all(20),
            child: Column(
              children: [
                TextField(
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.multiline,
                  maxLines: 8,
                  decoration: InputDecoration(
                    hintText: 'Description*',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                CupertinoButton(
                  onPressed: () {},
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
