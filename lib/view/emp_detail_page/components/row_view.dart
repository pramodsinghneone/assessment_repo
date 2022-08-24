import 'package:flutter/material.dart';

import '../../../core/textstyles.dart';
import '../../../core/universal_funtions.dart';
import '../../../core/widgets/common_text.dart';

class RowItemsCommon extends StatelessWidget {
  final String? titleValue;
  final String? title;
  const RowItemsCommon({Key? key, this.title, this.titleValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        sizedBoxWidth(30),
        Expanded(
            flex: 2,
            child: TextView(
              title: title,
              textStyle: detailTitleStyle,
            )),
        Flexible(
            flex: 2,
            child: TextView(
              title: titleValue,
              textStyle: detailTitleVStyle,
            )),
      ],
    );
  }
}
