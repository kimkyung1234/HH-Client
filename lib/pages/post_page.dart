import 'package:app/widgets/common.dart';
import 'package:app/widgets/list_card_widget.dart';
import 'package:flutter/material.dart';

class PostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.transparent,
              expandedHeight: 300.0,
              floating: false,
              pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    flexibleText(
                      text: 'Introduce your pet',
                      fontSize: 22,
                      textColor: const Color(0xffFAF9F9),
                      fontWeight: FontWeight.bold,
                      alignment: Alignment.bottomLeft,
                      padding: const EdgeInsets.only(left: 13, bottom: 5),
                    ),
                    flexibleText(
                      text:
                          'Let people know by posting about your pet. And communicate freely with various people.',
                      fontSize: 10,
                      textColor: const Color(0xffFAF9F9),
                      fontWeight: FontWeight.bold,
                      alignment: Alignment.bottomLeft,
                      padding:
                          const EdgeInsets.only(left: 13, right: 20, bottom: 5),
                    ),
                  ],
                ),
                background: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://images.unsplash.com/photo-1647631703221-e1e7ede1767b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1064&q=80',
                      ),
                      fit: BoxFit.cover,
                      colorFilter:
                          ColorFilter.mode(Colors.grey, BlendMode.colorBurn),
                    ),
                  ),
                ),
              ),
            ),
          ];
        },
        body: Column(
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
      ),
    );
  }
}
