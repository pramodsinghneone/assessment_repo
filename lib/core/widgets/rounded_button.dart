import 'package:assignment_task_employee_details/core/textstyles.dart';
import 'package:assignment_task_employee_details/core/widgets/common_text.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../strings.dart';

class RoundedButtonView extends StatelessWidget {
  final String? title;
  Function()? onTap;
  RoundedButtonView({Key? key, this.onTap, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 65,
        width: double.infinity,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 25.0,
              spreadRadius: 15.0,
              offset: Offset(
                15.0, // Move to right 10  horizontally
                15.0, // Move to bottom 10 Vertically
              ),
            )
          ],
        ),
        child: Center(
            child: TextView(
          title: title,
          textStyle: submitDetailsBtnStyleBlack,
        )),
      ),
    );
  }
}
