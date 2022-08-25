import 'package:assignment_task_employee_details/core/universal_funtions.dart';
import 'package:assignment_task_employee_details/core/widgets/common_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../core/params/employee_details_request_params.dart';
import '../../../core/strings.dart';
import '../../../core/textstyles.dart';
import '../../../core/widgets/elevated_button.dart';
import '../../../view_model/employee_page_controller.dart';
import '../../emp_form_page/emp_form_page.dart';

class OptionItems extends StatefulWidget {
  final EmployeeDetailsParams? employeeDetailsParams;
  final int? index;
  const OptionItems({Key? key, this.employeeDetailsParams, this.index})
      : super(key: key);

  @override
  State<OptionItems> createState() => _OptionItemsState();
}

class _OptionItemsState extends State<OptionItems> {
  late final Box employeeBox;
  @override
  void initState() {
    super.initState();
    callAPI();
  }

  callAPI() {
    employeeBox = Hive.box("employee_details");
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _mainTitle(),
            sizedBoxHeight(20),
            _rowItems(),
          ],
        ),
      ),
    );
  }

  Widget _mainTitle() {
    return TextView(
      title: selectOption,
      textStyle: optionMainTitleStyle,
    );
  }

  Widget _rowItems() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: _commonBtn(
            "Edit",
            editOption,
          ),
        ),
        sizedBoxWidth(20),
        Flexible(
          child: _commonBtn(
            "Delete",
            deleteOption,
          ),
        ),
      ],
    );
  }

  Widget _commonBtn(String title, Function()? onTap) {
    return ElevatedButtonView(
      horizontal: 30,
      vertical: 10,
      fontSize: 20,
      btnTitle: title,
      onTap: onTap,
    );
  }

  void editOption() {
    try {
      Get.back();

      Get.find<EmployeeDetailsController>().employeeDetailsParams.value =
          widget.employeeDetailsParams!;
      Get.find<EmployeeDetailsController>().updateIndex.value =
          widget.index! - 1;
      Get.find<EmployeeDetailsController>().isUpdate.value = true;

      Get.to(const EmployeeFormPage());
    } catch (e) {
      print(e.toString());
    }
  }

  void deleteOption() {
    try {
      Get.back();
      employeeBox.deleteAt(widget.index! - 1);
      if (employeeBox.isEmpty) {
        Get.find<EmployeeDetailsController>().boxHasValue.value = false;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
