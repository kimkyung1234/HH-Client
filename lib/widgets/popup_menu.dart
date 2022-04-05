import 'package:app/pages/profile/edit_profile_page.dart';
import 'package:app/pages/setting_page.dart';
import 'package:app/providers/edit_profile.dart';
import 'package:app/providers/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PopupMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<EditProfile>(context);
    var themeMode = Provider.of<ThemeChanger>(context);
    var theme = themeMode.getThemeData;

    return PopupMenuButton<int>(
      color: theme.canvasColor,
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
        PopupMenuItem(
          value: 0,
          child: Text(
            'Edit Profile',
            style: TextStyle(color: theme.accentColor),
          ),
        ),
        PopupMenuItem(
          value: 1,
          child: Text(
            'Settings',
            style: TextStyle(color: theme.accentColor),
          ),
        ),
      ],
      icon: Icon(
        Icons.more_vert,
        color: theme.accentColor,
      ),
    );
  }
}
