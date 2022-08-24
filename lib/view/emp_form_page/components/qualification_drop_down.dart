import 'package:flutter/material.dart';

import '../../../core/widgets/common_drop_down.dart';
import '../../../core/widgets/common_textformfields.dart';

Widget dropDownField({
  List<String>? listItems,
  String? dropValues,
  TextEditingController? controller,
  Function(String)? onChange,
  required String? initialValues,
}) {
  return Row(
    children: [
      Flexible(
        flex: 2,
        child: DropDownView(
          items: listItems,
          dropdownvalue: dropValues ?? initialValues,
          onChanged: (value) {
            onChange!(value);
          },
        ),
      ),
      Flexible(
        child: FormContainerWidget(
          hintText: "%",
          controller: controller,
          inputType: TextInputType.number,
          maxLength: 5,
        ),
      ),
    ],
  );
}
