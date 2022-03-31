import 'package:app/pages/post_page.dart';
import 'package:app/pages/profile_page.dart';
import 'package:app/providers/page.dart';
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

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _children[provider.getCurrentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
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
