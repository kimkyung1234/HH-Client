import 'package:app/providers/providers.dart';
import 'package:app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Pages>(context);

    return FutureBuilder(
      future: provider.firstLoad(),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (provider.getPostList.length == 0) {
          return const Center(child: Text('No data'));
        }
        return provider.getGridSort
            ? Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: GridListWidget(),
              )
            : ListWidget();
      },
    );
  }
}
