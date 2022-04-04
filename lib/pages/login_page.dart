import 'package:app/pages/signup_page.dart';
import 'package:app/providers/login.dart';
import 'package:app/services/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'home_page.dart';

class LoginPage extends StatelessWidget {
  final idText = TextEditingController();
  final passwordText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LoginHelper>(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SvgPicture.asset(
                'assets/image/logo2.svg',
                width: 100,
                height: 100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
                children: [
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
                    onPressed: () {
                      // signIn(
                      //   id: idText.text,
                      //   password: passwordText.text,
                      //   context: context,
                      // );
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    },
                    child: const Text('Sign In'),
                    color: Colors.black,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignupPage(),
                        ),
                      );
                    },
                    child: const Text('Sign Up'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
