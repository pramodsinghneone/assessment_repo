import 'package:assignment_task_employee_details/core/textstyles.dart';
import 'package:assignment_task_employee_details/core/widgets/common_text.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../strings.dart';

class RoundedButtonHorizontalView extends StatelessWidget {
  final String? title;
  final String? btn2Title;
  Function()? onTap;
  Function()? onTapBtn2;
  RoundedButtonHorizontalView({
    Key? key,
    this.onTap,
    this.title,
    this.btn2Title,
    this.onTapBtn2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      decoration: BoxDecoration(
        color: transparent,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 10),
            child: InkWell(
              onTap: onTap,
              child: Container(
                width: 150,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.8),
                      blurRadius: 25.0,
                      spreadRadius: 0.0,
                      offset: const Offset(
                        15.0, // Move to right 10  horizontally
                        15.0, // Move to bottom 10 Vertically
                      ),
                    )
                  ],
                ),
                child: Center(
                    child: TextView(
                  title: title,
                  textStyle: submitDetailsBtnStyle,
                )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0, bottom: 10),
            child: InkWell(
              onTap: onTapBtn2,
              child: Container(
                width: 150,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      blurRadius: 25.0,
                      spreadRadius: 0.0,
                      offset: const Offset(
                        15.0, // Move to right 10  horizontally
                        15.0, // Move to bottom 10 Vertically
                      ),
                    ),
                  ],
                ),
                child: Center(
                    child: TextView(
                  title: btn2Title,
                  textStyle: submitDetailsBtnStyle,
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
