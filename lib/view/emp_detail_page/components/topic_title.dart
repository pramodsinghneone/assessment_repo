import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../../core/textstyles.dart';
import '../../../core/widgets/common_text.dart';

class TopicTitleView extends StatelessWidget {
  final String? title;
  TopicTitleView({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: greyLight2,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextView(title: title, textStyle: detailTopicStyle),
        ),
      ),
    );
  }
}
