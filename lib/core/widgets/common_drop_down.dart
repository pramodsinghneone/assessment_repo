import 'package:assignment_task_employee_details/core/constants.dart';
import 'package:assignment_task_employee_details/core/widgets/common_text.dart';
import 'package:flutter/material.dart';

import '../textstyles.dart';

class DropDownView extends StatefulWidget {
  String? dropdownvalue;
  Function(String)? onChanged;

  final List<String>? items;
  DropDownView({Key? key, this.dropdownvalue, this.items, this.onChanged})
      : super(key: key);

  @override
  State<DropDownView> createState() => _DropDownViewState();
}

class _DropDownViewState extends State<DropDownView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: DropdownButton<String>(
          value: widget.dropdownvalue,
          selectedItemBuilder: (_) {
            return widget.items!.map((e) {
              return Text(widget.dropdownvalue!,
                  style: TextStyle(
                      color: blackColor.withOpacity(0.6),
                      fontWeight: FontWeight.w400));
            }).toList();
          },
          icon: const Icon(Icons.keyboard_arrow_down),
          isDense: true,
          isExpanded: true,
          items: widget.items!.map((value) {
            return DropdownMenuItem<String>(
              value: value,
              child: TextView(
                title: value,
                textStyle: dropdownStyle,
              ),
            );
          }).toList(),
          onChanged: (value) {
            widget.onChanged!(value!);
          }),
    );
  }
}
