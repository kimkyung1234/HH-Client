import 'package:app/providers/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatelessWidget {
  final userText = TextEditingController();
  final idText = TextEditingController();
  final passwordText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LoginHelper>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              children: [
                const SizedBox(height: 100),
                TextField(
                  controller: userText,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    labelText: 'User Name',
                    labelStyle: const TextStyle(color: Colors.black),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: idText,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: const TextStyle(color: Colors.black),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: passwordText,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: const TextStyle(color: Colors.black),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    suffixIcon: provider.getVisible == true
                        ? IconButton(
                            icon: const Icon(
                              Icons.visibility_off,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              provider.setvisible();
                            },
                          )
                        : IconButton(
                            icon: const Icon(
                              Icons.visibility,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              provider.setInvisible();
                            },
                          ),
                  ),
                  autofocus: false,
                  obscureText: provider.getVisible,
                ),
                const SizedBox(height: 20),
                CupertinoButton(
                  onPressed: () {},
                  child: const Text('Sign Up'),
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
