import 'package:app/pages/pages.dart';
import 'package:app/providers/providers.dart';
import 'package:app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class GridListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Pages>(context);
    var postLength = provider.getPostList.length;

    return MasonryGridView.count(
      key: const PageStorageKey<String>('controllerA'),
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      itemCount: postLength,
      itemBuilder: (context, index) {
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
                  strText: data.strText ?? '',
                  strImage: data.strImage ?? '',
                  strUser: data.strUser ?? '',
                  strDescription: data.strDescription ?? '',
                ),
              ),
            );
          },
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              child: carryImageWidget(
                url: data.strImage ?? '',
                boxFit: BoxFit.fitHeight,
              ),
            ),
          ),
        );
      },
    );
  }
}
