import 'package:app/models/profile.dart';
import 'package:app/services/api.dart';
import 'package:app/widgets/common.dart';
import 'package:app/widgets/my_post_List.dart';
import 'package:app/widgets/profile_widget.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
          ),
        ],
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
              flexibleText(
                text: data.strDescription!,
                fontSize: 19,
              ),
              const SizedBox(height: 20),
              flexibleText(
                  text: 'Posts',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  alignment: Alignment.topLeft,
                  padding:
                      const EdgeInsets.only(left: 15, top: 20, bottom: 15)),
              Expanded(
                child: MyPostListWidget(),
              ),
            ],
          );
        },
      ),
    );
  }
}
