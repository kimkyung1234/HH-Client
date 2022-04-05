import 'package:app/models/profile.dart';
import 'package:app/pages/profile/add_post_page.dart';
import 'package:app/pages/profile/edit_profile_page.dart';
import 'package:app/providers/add_post.dart';
import 'package:app/providers/edit_profile.dart';
import 'package:app/services/api.dart';
import 'package:app/widgets/common.dart';
import 'package:app/widgets/my_post_List.dart';
import 'package:app/widgets/popup_menu.dart';
import 'package:app/widgets/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AddPost>(context);
    var editProfile = Provider.of<EditProfile>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {
            provider.reset();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddPostPage(),
              ),
            );
          },
          icon: const Icon(Icons.add_box_outlined, color: Colors.black),
        ),
        actions: [PopupMenu()],
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
              data.strDescription == ''
                  ? TextButton(
                      onPressed: () {
                        editProfile.reset();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditProfilePage()),
                        );
                      },
                      child: const Text('Add description'),
                    )
                  : flexibleText(
                      text: data.strDescription!,
                      fontSize: 19,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 24),
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
