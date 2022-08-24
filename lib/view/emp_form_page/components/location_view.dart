import 'package:flutter/material.dart';

import '../../../core/widgets/common_text.dart';

class LocationCheckBoxView extends StatelessWidget {
  final String? textTitle;
  final bool? checkBoxValue;
  Function(bool?)? onChanged;
  LocationCheckBoxView(
      {Key? key, this.checkBoxValue, this.onChanged, this.textTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: checkBoxValue,
          onChanged: (value) {
            onChanged!(value);
          },
        ),
        TextView(
          title: textTitle,
        ),
      ],
    );
  }
}
