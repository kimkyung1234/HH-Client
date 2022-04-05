import 'package:app/pages/post_page.dart';
import 'package:app/pages/profile/profile_page.dart';
import 'package:app/providers/page.dart';
import 'package:app/providers/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  final List<Widget> _children = [
    PostPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Pages>(context);
    var themeMode = Provider.of<ThemeChanger>(context);
    var theme = themeMode.getThemeData;

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: Center(
        child: _children[provider.getCurrentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: theme.backgroundColor,
        selectedItemColor: theme.accentColor,
        unselectedItemColor: Colors.grey,
        onTap: provider.onTabTapped,
        currentIndex: provider.getCurrentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
          ),
        ],
      ),
    );
  }
}
