import 'package:app/models/profile.dart';
import 'package:app/services/api.dart';
import 'package:app/widgets/common.dart';
import 'package:app/widgets/profile_widget.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: flexibleText(text: 'Profile', fontWeight: FontWeight.bold),
      ),
      body: FutureBuilder<Profile>(
        future: getProfile(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          var data = snapshot.data;
          return Column(
            children: [
              ProfileWidget(data: data!),
            ],
          );
        },
      ),
    );
  }
}
