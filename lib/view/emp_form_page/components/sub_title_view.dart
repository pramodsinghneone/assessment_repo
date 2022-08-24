import 'package:flutter/material.dart';

import '../../../core/textstyles.dart';
import '../../../core/widgets/common_text.dart';

class SubTitleView extends StatelessWidget {
  final String? title;
  const SubTitleView({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextView(
        title: title,
        textStyle: locationStyle,
      ),
    );
  }
}
