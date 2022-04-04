import 'package:app/services/login_api.dart';
import 'package:app/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

// class VertificationPage extends StatefulWidget {
//   @override
//   _VertificationPageState createState() => _VertificationPageState();
// }

// class _VertificationPageState extends State<VertificationPage> {
class VertificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
      ),
      body: SafeArea(
        child: Column(
          children: [
            flexibleText(
              text: 'Vertification Code',
              fontSize: 32,
              fontWeight: FontWeight.bold,
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 20, top: 20),
            ),
            flexibleText(
              text: 'Please enter your email code.',
              fontSize: 15,
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 23, bottom: 40),
            ),
            Center(
              child: VerificationCode(
                keyboardType: TextInputType.number,
                cursorColor: Colors.grey,
                underlineColor: Colors.black,
                length: 4,
                onCompleted: (String value) {
                  print(value);
                  postEmailCode(emailCode: value, context: context);
                },
                onEditing: (bool value) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
