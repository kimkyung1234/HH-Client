import 'package:app/models/post.dart';
import 'package:app/pages/detail_page.dart';
import 'package:app/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GridListWidget extends StatelessWidget {
  final AsyncSnapshot<Post> snapshot;
  const GridListWidget({
    Key? key,
    required this.snapshot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      itemCount: snapshot.data!.posts!.length,
      itemBuilder: (context, index) {
        var data = snapshot.data!.posts![index];
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
