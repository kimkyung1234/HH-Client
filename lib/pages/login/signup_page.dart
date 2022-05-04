import 'package:app/pages/pages.dart';
import 'package:app/providers/providers.dart';
import 'package:app/services/login_api.dart';
import 'package:app/widgets/widgets.dart';
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
                FieldWidget(
                  controller: _user,
                  errorText: provider.getUserValidate
                      ? 'User Name Can\'t Be Empty'
                      : null,
                  labelText: 'User Name*',
                ),
                const SizedBox(height: 20),
                FieldWidget(
                  controller: _email,
                  labelText: 'Email Id*',
                  errorText: provider.getEmailValidate
                      ? 'Email Can\'t Be Empty'
                      : null,
                ),
                const SizedBox(height: 20),
                FieldWidget(
                  controller: _password,
                  labelText: 'Password*',
                  errorText: provider.getPasswordValidate
                      ? 'Password Can\'t Be Empty'
                      : null,
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
