import 'package:app/pages/pages.dart';
import 'package:app/providers/login.dart';
import 'package:app/services/api.dart';
import 'package:app/services/login_api.dart';
import 'package:app/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatelessWidget {
  final idText = TextEditingController();
  final passwordText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LoginHelper>(context);
    var loginHelper = Provider.of<LoginHelper>(context);

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
                  FieldWidget(
                    controller: idText,
                    labelText: 'Email',
                  ),
                  const SizedBox(height: 20),
                  FieldWidget(
                    controller: passwordText,
                    labelText: 'Password',
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
                  const SizedBox(height: 20),
                  CupertinoButton(
                    onPressed: () {
                      signIn(
                        id: idText.text,
                        password: passwordText.text,
                        context: context,
                      );
                    },
                    child: const Text('Sign In'),
                    color: Colors.black,
                  ),
                  TextButton(
                    onPressed: () {
                      loginHelper.reset();
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
