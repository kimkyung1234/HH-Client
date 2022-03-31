import 'package:app/models/post.dart';
import 'package:app/services/api.dart';
import 'package:app/widgets/common.dart';
import 'package:flutter/material.dart';

class ListCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Post>(
      future: getList(),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.data?.posts?.length == null) {
          return const Center(child: Text('No data'));
        }
        return ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 14),
          padding: const EdgeInsets.all(18),
          itemCount: snapshot.data?.posts?.length ?? 0,
          itemBuilder: (_, index) {
            final data = snapshot.data?.posts?[index];
            return GestureDetector(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 130,
                child: Row(
                  children: <Widget>[
                    carryImageWidget(
                      url: data?.strImage ?? '',
                      boxFit: BoxFit.scaleDown,
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          flexibleText(
                            text: data?.strText ?? '',
                            alignment: Alignment.topLeft,
                            overflow: TextOverflow.ellipsis,
                          ),
                          flexibleText(
                            text: data?.strUser ?? '',
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
      },
    );
  }
}
