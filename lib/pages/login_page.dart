import 'package:app/pages/home_page.dart';
import 'package:app/providers/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LoginHelper>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FlutterLogo(
              size: 130,
            ),
            Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
                children: [
                  TextField(
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
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    },
                    child: const Text('Login'),
                    color: Colors.black,
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
