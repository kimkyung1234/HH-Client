import 'package:app/providers/providers.dart';
import 'package:app/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var themeMode = Provider.of<ThemeChanger>(context);
    var theme = themeMode.getThemeData;

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Settings',
          style:
              TextStyle(color: theme.accentColor, fontWeight: FontWeight.bold),
        ),
        leading: BackButton(color: theme.accentColor),
      ),
      body: ListView(
        children: [
          settingMenu(
            text: 'Dark mode',
            hintText: themeMode.getThemeDark ? 'On' : 'Off',
            textColor: theme.accentColor,
            widget: CupertinoSwitch(
              value: themeMode.getThemeDark,
              onChanged: (value) async {
                themeMode.getThemeDark
                    ? themeMode.setLight()
                    : themeMode.setDark();

                SharedPreferences mSharedPrefs =
                    await SharedPreferences.getInstance();
                mSharedPrefs.setBool('themeMode', value);

                final prefs = await SharedPreferences.getInstance();
                prefs.setBool('theme', value);
              },
            ),
          ),
          settingMenu(
            text: 'Change password',
            textColor: theme.accentColor,
            widget: Icon(
              Icons.arrow_forward_ios,
              color: theme.accentColor,
            ),
            onTap: () {},
          ),
          settingMenu(
            text: 'About',
            textColor: theme.accentColor,
            widget: Icon(
              Icons.arrow_forward_ios,
              color: theme.accentColor,
            ),
            onTap: () {},
          ),
          settingMenu(
            text: 'Logout',
            textColor: Colors.redAccent,
            widget: Icon(
              Icons.arrow_forward_ios,
              color: theme.accentColor,
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
