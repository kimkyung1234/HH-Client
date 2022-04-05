import 'dart:ui';

import 'package:flutter/material.dart';

Widget carryImageWidget(
    {required String url,
    BoxFit boxFit = BoxFit.fitHeight,
    double radius = 20}) {
  return Image.network(
    url,
    fit: boxFit,
    loadingBuilder:
        (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
      if (loadingProgress == null) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: SizedBox.fromSize(
            child: child,
          ),
        );
      }
      return Container(
        height: 100,
        width: 100,
        margin: const EdgeInsets.fromLTRB(0, 50, 0, 50),
        child: Center(
          child: CircularProgressIndicator(
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.black),
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                : null,
          ),
        ),
      );
    },
  );
}

Widget flexibleText({
  required String text,
  Color textColor = Colors.black,
  EdgeInsetsGeometry padding = const EdgeInsets.all(0),
  double fontSize = 20,
  FontWeight fontWeight = FontWeight.normal,
  AlignmentGeometry alignment = Alignment.center,
  TextOverflow? overflow,
}) {
  return Padding(
    padding: padding,
    child: Align(
      alignment: alignment,
      child: Text(
        text,
        overflow: overflow,
        style: TextStyle(
          fontWeight: fontWeight,
          fontSize: fontSize,
          color: textColor,
        ),
      ),
    ),
  );
}

Widget customCircularIndicator() {
  return const CircularProgressIndicator(
    valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
  );
}

Widget settingMenu(
    {required String text,
    required Widget widget,
    Color textColor = Colors.black,
    VoidCallback? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          flexibleText(text: text, textColor: textColor),
          widget,
        ],
      ),
    ),
  );
}
