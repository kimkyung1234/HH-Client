import 'package:app/providers/theme.dart';
import 'package:app/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  final String strText;
  final String strImage;
  final String strUser;
  final String strDescription;
  const DetailPage({
    Key? key,
    required this.strText,
    required this.strImage,
    required this.strUser,
    required this.strDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var themeMode = Provider.of<ThemeChanger>(context);
    var theme = themeMode.getThemeData;

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Detail',
          style: TextStyle(color: theme.accentColor),
        ),
        leading: BackButton(color: theme.accentColor),
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: carryImageWidget(url: strImage, boxFit: BoxFit.fill),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                flexibleText(
                  text: strText,
                  textColor: theme.accentColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  alignment: Alignment.topLeft,
                ),
                flexibleText(
                  text: strUser,
                  fontSize: 15,
                  textColor: theme.accentColor,
                  alignment: Alignment.topLeft,
                ),
                const SizedBox(height: 10),
                flexibleText(
                  text: 'Description',
                  fontSize: 25,
                  textColor: theme.accentColor,
                  fontWeight: FontWeight.bold,
                  alignment: Alignment.topLeft,
                ),
                Text(
                  strDescription,
                  style: TextStyle(color: theme.accentColor),
                ),
                const SizedBox(height: 200),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
