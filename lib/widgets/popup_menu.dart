import 'package:app/pages/profile/edit_profile_page.dart';
import 'package:app/pages/setting_page.dart';
import 'package:app/providers/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PopupMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<EditProfile>(context);
    return PopupMenuButton<int>(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      onSelected: (result) {
        if (result == 0) {
          provider.reset();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EditProfilePage()),
          );
        }
        if (result == 1) {
          provider.reset();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SettingPage()),
          );
        }
      },
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: 0,
          child: Text('Edit Profile'),
        ),
        const PopupMenuItem(
          value: 1,
          child: Text('Settings'),
        ),
      ],
      icon: const Icon(
        Icons.more_vert,
        color: Colors.black,
      ),
    );
  }
}
