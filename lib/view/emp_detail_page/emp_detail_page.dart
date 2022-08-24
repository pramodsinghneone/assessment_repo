import 'package:assignment_task_employee_details/core/universal_funtions.dart';
import 'package:assignment_task_employee_details/core/widgets/common_text.dart';
import 'package:assignment_task_employee_details/view/emp_detail_page/components/row_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants.dart';
import '../../core/params/employee_details_request_params.dart';
import '../../core/textstyles.dart';
import '../../view_model/employee_page_controller.dart';
import '../emp_form_page/emp_form_page.dart';
import 'components/topic_title.dart';

class EmployeeDetailPage extends StatefulWidget {
  final EmployeeDetailsParams? employeeDetailsParams;
  final int? index;
  EmployeeDetailPage({Key? key, this.employeeDetailsParams, this.index})
      : super(key: key);

  @override
  State<EmployeeDetailPage> createState() => _EmployeeDetailPageState();
}

class _EmployeeDetailPageState extends State<EmployeeDetailPage> {
  EmployeeDetailsParams? employeeDetail;

  @override
  void initState() {
    super.initState();
    initData();
  }

  initData() async {
    setState(() {
      employeeDetail = widget.employeeDetailsParams;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextView(
          title: "Detail Page",
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.find<EmployeeDetailsController>().clearAllData();
            Get.back();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Get.find<EmployeeDetailsController>()
                  .employeeDetailsParams
                  .value = employeeDetail!;
              Get.find<EmployeeDetailsController>().updateIndex.value =
                  widget.index! - 1;
              Get.find<EmployeeDetailsController>().isUpdate.value = true;

              Get.to(const EmployeeFormPage());
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            sizedBoxHeight(heightValue),
            TopicTitleView(title: "Personal Details :"),
            sizedBoxHeight(heightValue),
            RowItemsCommon(
              title: "Name :",
              titleValue:
                  "${employeeDetail!.firstName} ${employeeDetail!.lastName}",
            ),
            sizedBoxHeight(heightValue),
            RowItemsCommon(
              title: "Gender :",
              titleValue: "${employeeDetail!.gender}",
            ),
            sizedBoxHeight(heightValue),
            RowItemsCommon(
              title: "Phone No. :",
              titleValue: "${employeeDetail!.phoneNumber}",
            ),
            sizedBoxHeight(heightValue),
            RowItemsCommon(
              title: "Email_Id :",
              titleValue: "${employeeDetail!.emailId}",
            ),
            sizedBoxHeight(heightValue),
            RowItemsCommon(
              title: "Date of Birth :",
              titleValue: "${employeeDetail!.dob}",
            ),
            sizedBoxHeight(heightValue),
            TopicTitleView(title: "Qualifications :"),
            sizedBoxHeight(heightValue),
            RowItemsCommon(
              title: "Post Graduation :",
              titleValue:
                  "${employeeDetail!.postGraduation} / ${employeeDetail!.postGraduationPercentage}%",
            ),
            sizedBoxHeight(heightValue),
            RowItemsCommon(
              title: "Graduation :",
              titleValue:
                  "${employeeDetail!.graduation} / ${employeeDetail!.graduationPercentage}%",
            ),
            sizedBoxHeight(heightValue),
            RowItemsCommon(
              title: "Higher Secondary :",
              titleValue:
                  "${employeeDetail!.hsc} / ${employeeDetail!.hscPercentage}%",
            ),
            sizedBoxHeight(heightValue),
            RowItemsCommon(
              title: "Secondary :",
              titleValue:
                  "${employeeDetail!.ssc} / ${employeeDetail!.sscPercentage}%",
            ),
            sizedBoxHeight(heightValue),
            TopicTitleView(title: "Work Preference :"),
            sizedBoxHeight(heightValue),
            RowItemsCommon(
              title: "Location :",
              titleValue: "${employeeDetail!.locationWorkPeref}",
            ),
            sizedBoxHeight(heightValue),
            TopicTitleView(title: "Shift :"),
            sizedBoxHeight(heightValue),
            RowItemsCommon(
              title: "Shift :",
              titleValue: "${employeeDetail!.shift}",
            ),
            sizedBoxHeight(heightValue),
            TopicTitleView(title: "Type of Employement :"),
            sizedBoxHeight(heightValue),
            RowItemsCommon(
              title: "Type :",
              titleValue: "${employeeDetail!.typeOfEmployement}",
            ),
            sizedBoxHeight(heightValue),
            TopicTitleView(title: "Available on Weekends :"),
            sizedBoxHeight(heightValue),
            RowItemsCommon(
              title: "Available :",
              titleValue: employeeDetail!.availableOnWeekends! ? "Yes" : "No",
            ),
            sizedBoxHeight(heightValue30),
          ],
        ),
      ),
    );
  }
}
