import 'package:app/models/post.dart';
import 'package:app/services/api.dart';
import 'package:app/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MyPostListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Post>(
      future: getMyPost(),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.data?.posts?.length == null) {
          return const Center(child: Text('No data'));
        }

        return Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            color: Color(0xffEEEEEE),
          ),
          child: Container(
            margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
            child: MasonryGridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 12,
              itemCount: snapshot.data!.posts!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      child: carryImageWidget(
                        url: snapshot.data!.posts![index].strImage ?? '',
                        boxFit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
