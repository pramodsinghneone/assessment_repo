import 'package:flutter/material.dart';

import '../constants.dart';
import '../textstyles.dart';
import 'common_text.dart';

class ElevatedButtonView extends StatelessWidget {
  final String? btnTitle;
  Function()? onTap;
  ElevatedButtonView({Key? key, this.btnTitle, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: blueColor,
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
          textStyle:
              const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
      onPressed: onTap,
      child: TextView(
        title: btnTitle,
        textStyle: submitDetailsBtnStyle,
      ),
    );
  }
}
