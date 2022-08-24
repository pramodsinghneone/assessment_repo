import 'package:assignment_task_employee_details/core/constants.dart';
import 'package:assignment_task_employee_details/view/emp_detail_page/emp_detail_page.dart';
import 'package:assignment_task_employee_details/view/emp_form_page/emp_form_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/params/employee_details_request_params.dart';
import '../../../core/textstyles.dart';
import '../../../core/universal_funtions.dart';
import '../../../core/widgets/common_text.dart';
import '../../../view_model/employee_page_controller.dart';

class ListBodyView extends StatelessWidget {
  final EmployeeDetailsParams? employeeDetailsParams;
  final int? index;
  ListBodyView({
    Key? key,
    this.employeeDetailsParams,
    this.index,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    String? createdOn;
    String? updatedOn;
    if (employeeDetailsParams!.createdOn != null) {
      var dateTime = employeeDetailsParams!.createdOn;
      createdOn = dateFormatWithTime.format(dateTime!);
    } else {
      var dateTime = employeeDetailsParams!.updatedOn;
      updatedOn = dateFormatWithTime.format(dateTime!);
    }

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          onLongPress: () {},
          onTap: () {
            Get.to(EmployeeDetailPage(
                employeeDetailsParams: employeeDetailsParams, index: index));
          },
          leading: const Icon(
            Icons.person,
            size: 30,
          ),
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextView(
              title:
                  "${employeeDetailsParams!.firstName} ${employeeDetailsParams!.lastName}",
              textStyle: emplTitleMainStyle,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextView(
              title: createdOn != null
                  ? "created on: $createdOn"
                  : "updated on: $updatedOn",
              textStyle: subtitleStyle,
            ),
          ),
          trailing: InkWell(
              onTap: () {
                Get.to(EmployeeDetailPage(
                    employeeDetailsParams: employeeDetailsParams,
                    index: index));
              },
              child: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 17.0,
              )),
        ),
      ),
    );
  }
}
