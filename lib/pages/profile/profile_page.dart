import 'package:app/models/profile.dart';
import 'package:app/pages/pages.dart';
import 'package:app/providers/providers.dart';
import 'package:app/services/api.dart';
import 'package:app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AddPost>(context);
    var editProfile = Provider.of<EditProfile>(context);
    var themeMode = Provider.of<ThemeChanger>(context);
    var theme = themeMode.getThemeData;

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Profile',
          style:
              TextStyle(color: theme.accentColor, fontWeight: FontWeight.bold),
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
          icon: Icon(Icons.add_box_outlined, color: theme.accentColor),
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
                      textColor: theme.accentColor,
                      fontSize: 19,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 24),
                    ),
              const SizedBox(height: 20),
              flexibleText(
                  text: 'Posts',
                  textColor: theme.accentColor,
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
