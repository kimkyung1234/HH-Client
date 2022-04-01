import 'package:app/widgets/common.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Detail',
          style: TextStyle(color: Colors.black),
        ),
        leading: const BackButton(color: Colors.black),
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
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  alignment: Alignment.topLeft,
                ),
                flexibleText(
                  text: strUser,
                  fontSize: 15,
                  textColor: const Color(0xff565555),
                  alignment: Alignment.topLeft,
                ),
                const SizedBox(height: 10),
                flexibleText(
                  text: 'Description',
                  fontSize: 25,
                  textColor: const Color(0xff3C3838),
                  fontWeight: FontWeight.bold,
                  alignment: Alignment.topLeft,
                ),
                Text(strDescription),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
