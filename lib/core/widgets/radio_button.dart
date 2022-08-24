import 'package:flutter/material.dart';

class RadioButtonView extends StatefulWidget {
  final String? title;
  String? value;
  String? groupValue;
  Function(String?)? onChanged;
  RadioButtonView(
      {Key? key, this.groupValue, this.title, this.value, this.onChanged})
      : super(key: key);

  @override
  State<RadioButtonView> createState() => _RadioButtonViewState();
}

class _RadioButtonViewState extends State<RadioButtonView> {
  @override
  Widget build(BuildContext context) {
    return RadioListTile<String>(
      title: Text(widget.title ?? ""),
      value: widget.value ?? '',
      groupValue: widget.groupValue,
      onChanged: (value) {
        widget.onChanged!(value);
      },
    );
  }
}
