import 'package:flutter/material.dart';

class TextView extends StatelessWidget {
  final String? title;
  final TextStyle? textStyle;

  const TextView({Key? key, required this.title, this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title!,
      style: textStyle,
    );
  }
}
