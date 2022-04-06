import 'package:app/models/post.dart';
import 'package:app/providers/providers.dart';
import 'package:app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListCardWidget extends StatelessWidget {
  final Future<Post> future;
  const ListCardWidget({
    Key? key,
    required this.future,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Pages>(context);
    var themeMode = Provider.of<ThemeChanger>(context);
    var theme = themeMode.getThemeData;

    return FutureBuilder<Post>(
      future: future,
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.data?.posts?.length == 0) {
          return const Center(child: Text('No data'));
        }
        return provider.getGridSort
            ? Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: GridListWidget(snapshot: snapshot),
              )
            : ListWidget(
                snapshot: snapshot,
              );
      },
    );
  }
}
