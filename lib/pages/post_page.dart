import 'package:app/providers/providers.dart';
import 'package:app/services/api.dart';
import 'package:app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Pages>(context);
    var themeMode = Provider.of<ThemeChanger>(context);
    var theme = themeMode.getThemeData;

    return Scaffold(
      backgroundColor: theme.backgroundColor,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                flexibleText(
                  text: 'Posts',
                  textColor: theme.accentColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 43,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 20, top: 10, bottom: 1),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: provider.getGridSort
                      ? IconButton(
                          onPressed: () async {
                            provider.changeSort(false);
                            final prefs = await SharedPreferences.getInstance();
                            prefs.setBool('sort', false);
                          },
                          icon: Icon(
                            Icons.list,
                            color: theme.accentColor,
                            size: 30,
                          ),
                        )
                      : IconButton(
                          onPressed: () async {
                            provider.changeSort(true);
                            final prefs = await SharedPreferences.getInstance();
                            prefs.setBool('sort', true);
                          },
                          icon: Icon(
                            Icons.space_dashboard_outlined,
                            color: theme.accentColor,
                            size: 30,
                          ),
                        ),
                ),
              ],
            ),
            Expanded(
              child: ListCardWidget(future: getList()),
            ),
          ],
        ),
      ),
    );
  }
}
