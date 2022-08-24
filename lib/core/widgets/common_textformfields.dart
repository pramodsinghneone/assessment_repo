import 'package:assignment_task_employee_details/core/constants.dart';

import 'package:flutter/material.dart';

class FormContainerWidget extends StatefulWidget {
  final TextEditingController? controller;
  final Key? fieldKey;
  final bool? isCalenderShow;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputType? inputType;
  final void Function()? onTap;
  final void Function()? tfOnClick;
  final int? maxLength;

  const FormContainerWidget({
    this.controller,
    this.isCalenderShow,
    this.fieldKey,
    this.hintText,
    this.labelText,
    this.helperText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
    this.inputType,
    this.onTap,
    this.maxLength,
    this.tfOnClick,
  });

  @override
  _FormContainerWidgetState createState() => new _FormContainerWidgetState();
}

class _FormContainerWidgetState extends State<FormContainerWidget> {
  bool showCalender = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: transparent,
        borderRadius: BorderRadius.circular(3),
      ),
      child: TextFormField(
        onTap: widget.tfOnClick,
        style: TextStyle(color: blackColor),
        controller: widget.controller,
        keyboardType: widget.inputType,
        key: widget.fieldKey,
        onSaved: widget.onSaved,
        validator: widget.validator,
        maxLength: widget.maxLength,
        onFieldSubmitted: widget.onFieldSubmitted,
        decoration: InputDecoration(
          counterText: "",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(width: 0.4),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue, width: 0.4),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 0.4),
            borderRadius: BorderRadius.circular(10.0),
          ),
          filled: true,
          contentPadding: const EdgeInsets.all(10),
          hintText: widget.hintText,
          hintStyle: TextStyle(color: grey),
          suffixIcon: GestureDetector(
            onTap: widget.onTap,
            child: widget.isCalenderShow == true
                ? Icon(
                    showCalender ? Icons.calendar_month : null,
                    color: showCalender == false ? transparent : grey,
                  )
                : const Text(""),
          ),
        ),
      ),
    );
  }
}
