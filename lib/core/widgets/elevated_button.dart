import 'package:flutter/material.dart';

import '../constants.dart';
import '../textstyles.dart';
import 'common_text.dart';

class ElevatedButtonView extends StatelessWidget {
  final String? btnTitle;
  Function()? onTap;
  final double? horizontal;
  final double? vertical;
  final double? fontSize;
  ElevatedButtonView({
    Key? key,
    this.btnTitle,
    this.onTap,
    this.fontSize = 30,
    this.horizontal = 50,
    this.vertical = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: blueColor,
          padding: EdgeInsets.symmetric(
              horizontal: horizontal!, vertical: vertical!),
          textStyle:
              TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold)),
      onPressed: onTap,
      child: TextView(
        title: btnTitle,
        textStyle: submitOptionBtnStyle,
      ),
    );
  }
}
