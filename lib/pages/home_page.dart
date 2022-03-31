import 'package:app/providers/page.dart';
import 'package:app/widgets/common.dart';
import 'package:app/widgets/list_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  final List<Widget> _children = [
    Column(
      children: [
        const SizedBox(height: 30),
        flexibleText(
          text: 'Posts',
          fontWeight: FontWeight.bold,
          fontSize: 43,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(20),
        ),
        Expanded(child: ListCardWidget()),
      ],
    ),
    const Text('Profile'),
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
