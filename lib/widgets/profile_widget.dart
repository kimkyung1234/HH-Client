import 'package:app/models/profile.dart';
import 'package:app/providers/providers.dart';
import 'package:app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileWidget extends StatelessWidget {
  final Profile data;
  const ProfileWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var themeMode = Provider.of<ThemeChanger>(context);
    var theme = themeMode.getThemeData;

    return Container(
      decoration: BoxDecoration(
        color: theme.canvasColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      margin: const EdgeInsets.all(20),
      child: Row(
        children: [
          data.strImage == ''
              ? Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    color: const Color(0xffDBDADA),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Icon(
                    Icons.person_outlined,
                    color: theme.accentColor,
                    size: 70,
                  ),
                )
              : SizedBox(
                  width: 130,
                  height: 130,
                  child: carryImageWidget(url: data.strImage ?? ''),
                ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              flexibleText(
                text: data.strName ?? '',
                textColor: theme.accentColor,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              flexibleText(
                text: data.strEmail ?? '',
                textColor: theme.accentColor,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
