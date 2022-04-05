import 'package:app/models/post.dart';
import 'package:app/pages/detail_page.dart';
import 'package:app/providers/theme.dart';
import 'package:app/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListWidget extends StatelessWidget {
  final AsyncSnapshot<Post> snapshot;
  const ListWidget({
    Key? key,
    required this.snapshot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var themeMode = Provider.of<ThemeChanger>(context);
    var theme = themeMode.getThemeData;

    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 14),
      padding: const EdgeInsets.all(18),
      itemCount: snapshot.data?.posts?.length ?? 0,
      itemBuilder: (_, index) {
        final data = snapshot.data?.posts?[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(
                  strText: data?.strText ?? '',
                  strImage: data?.strImage ?? '',
                  strUser: data?.strUser ?? '',
                  strDescription: data?.strDescription ?? '',
                ),
              ),
            );
          },
          child: Row(
            children: [
              Container(
                height: 130,
                width: 130,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: carryImageWidget(
                    url: data?.strImage ?? '',
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
                      text: data?.strText ?? '',
                      textColor: theme.accentColor,
                      fontWeight: FontWeight.bold,
                      alignment: Alignment.topLeft,
                      overflow: TextOverflow.ellipsis,
                    ),
                    flexibleText(
                      text: data?.strUser ?? '',
                      textColor: theme.accentColor,
                      fontSize: 14,
                      alignment: Alignment.topLeft,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
