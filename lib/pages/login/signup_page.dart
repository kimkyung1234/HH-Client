import 'package:app/pages/pages.dart';
import 'package:app/providers/providers.dart';
import 'package:app/services/login_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatelessWidget {
  final _user = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();

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
                  controller: _user,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    labelText: 'User Name*',
                    errorText: provider.getUserValidate
                        ? 'User Name Can\'t Be Empty'
                        : null,
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
                  controller: _email,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    labelText: 'Email Id*',
                    errorText: provider.getEmailValidate
                        ? 'Email Can\'t Be Empty'
                        : null,
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
                  controller: _password,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    labelText: 'Password*',
                    errorText: provider.getPasswordValidate
                        ? 'Password Can\'t Be Empty'
                        : null,
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
                    _user.text.isEmpty
                        ? provider.setUserValidate(true)
                        : provider.setUserValidate(false);

                    _email.text.isEmpty
                        ? provider.setEmailValidate(true)
                        : provider.setEmailValidate(false);

                    _password.text.isEmpty
                        ? provider.setPasswordValidate(true)
                        : provider.setPasswordValidate(false);

                    if (provider.getUserValidate == false ||
                        provider.getEmailValidate == false ||
                        provider.getPasswordValidate == false) {
                      signUp(
                        user: _user.text,
                        email: _email.text,
                        password: _password.text,
                        context: context,
                      );
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => VertificationPage(),
                      //   ),
                      // );
                    } else {
                      var snackBar = const SnackBar(
                          content: Text('Wrong text please check'));

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
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
