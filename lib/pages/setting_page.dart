import 'package:app/providers/theme.dart';
import 'package:app/widgets/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            textColor: theme.accentColor,
            widget: CupertinoSwitch(
              value: themeMode.getThemeDark,
              onChanged: (value) {
                themeMode.getThemeDark
                    ? themeMode.setLight()
                    : themeMode.setDark();
              },
            ),
          ),
        ],
      ),
    );
  }
}
