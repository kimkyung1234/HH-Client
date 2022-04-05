import 'package:app/models/post.dart';
import 'package:app/providers/theme.dart';
import 'package:app/services/api.dart';
import 'package:app/widgets/grid_list_wiget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyPostListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var themeMode = Provider.of<ThemeChanger>(context);
    var theme = themeMode.getThemeData;

    return FutureBuilder<Post>(
      future: getMyPost(),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.data?.posts?.length == 0) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: theme.canvasColor,
            ),
            child: const Center(
              child: Text('No data'),
            ),
          );
        }

        return Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            color: theme.canvasColor,
          ),
          child: Container(
            margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
            child: GridListWidget(snapshot: snapshot),
          ),
        );
      },
    );
  }
}
