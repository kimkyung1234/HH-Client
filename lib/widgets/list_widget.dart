import 'package:app/pages/pages.dart';
import 'package:app/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'common.dart';

class ListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var themeMode = Provider.of<ThemeChanger>(context);
    var theme = themeMode.getThemeData;

    var provider = Provider.of<Pages>(context);
    var postLength = provider.getPostList.length;

    return ListView.separated(
      key: const PageStorageKey<String>('controllerA'),
      separatorBuilder: (context, index) => const SizedBox(height: 14),
      padding: const EdgeInsets.all(18),
      itemCount: postLength,
      itemBuilder: (_, index) {
        final data = provider.getPostList[index];
        if (index == postLength - 1) {
          return TextButton(
            onPressed: () {
              provider.loadMore();
            },
            child: const Text('more'),
          );
        }
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(
                  strText: data.strTitle ?? '',
                  strImage: data.strImage ?? '',
                  strUser: data.strUser ?? '',
                  strDescription: data.strContent ?? '',
                ),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: theme.canvasColor,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Row(
              children: [
                Container(
                  height: 130,
                  width: 130,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: carryImageWidget(
                      url: data.strImage ?? '',
                      boxFit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      flexibleText(
                        text: data.strTitle ?? '',
                        textColor: theme.accentColor,
                        fontWeight: FontWeight.bold,
                        alignment: Alignment.topLeft,
                        overflow: TextOverflow.ellipsis,
                      ),
                      flexibleText(
                        text: data.strUser ?? '',
                        textColor: theme.accentColor,
                        fontSize: 14,
                        alignment: Alignment.topLeft,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
