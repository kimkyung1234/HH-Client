import 'package:app/models/profile.dart';
import 'package:app/widgets/common.dart';
import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  final Profile data;
  const ProfileWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Row(
        children: [
          SizedBox(
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
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              flexibleText(
                text: data.strEmail ?? '',
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
