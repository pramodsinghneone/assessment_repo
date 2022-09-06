import 'package:assignment_task_employee_details/core/widgets/radio_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/strings.dart';
import '../../core/textstyles.dart';
import '../../core/universal_funtions.dart';
import '../../core/widgets/common_drop_down.dart';
import '../../core/widgets/common_text.dart';
import '../../core/widgets/common_textformfields.dart';
import '../../core/widgets/rounded_button.dart';
import '../../core/widgets/rounded_button_horizontal.dart';
import '../../view_model/employee_page_controller.dart';
import '../emp_detail_page/components/topic_title.dart';
import '../home_page.dart';
import 'components/location_view.dart';
import 'components/qualification_drop_down.dart';
import 'components/sub_title_view.dart';

class EmployeeFormPage extends StatefulWidget {
  const EmployeeFormPage({Key? key}) : super(key: key);

  @override
  State<EmployeeFormPage> createState() => _EmployeeFormPageState();
}

class _EmployeeFormPageState extends State<EmployeeFormPage> {
  EmployeeDetailsController employeeDetailsController =
      Get.put(EmployeeDetailsController());

  @override
  void initState() {
    super.initState();
    setValuesCall();
  }

  setValuesCall() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        if (!mounted) return;
        employeeDetailsController.setValues();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextView(title: employeeDetails, textStyle: appBarTextStyle),
      ),
      bottomNavigationBar: Obx(
        () => employeeDetailsController.boxHasValue.value
            ? RoundedButtonHorizontalView(
                title: submitDetails,
                btn2Title: showList,
                onTap: () {
                  employeeDetailsController.onSubmitBtn();
                },
                onTapBtn2: () {
                  Get.to(const HomePage());
                },
              )
            : RoundedButtonView(
                title: submitDetails,
                onTap: () {
                  employeeDetailsController.onSubmitBtn();
                },
              ),
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sizedBoxHeight(20),
              TopicTitleView(title: personalDetails),
              sizedBoxHeight(20),
              FormContainerWidget(
                hintText: firstName,
                controller: employeeDetailsController.firstNameController,
              ),
              sizedBoxHeight(20),
              FormContainerWidget(
                hintText: lastName,
                controller: employeeDetailsController.lastNameController,
              ),
              sizedBoxHeight(20),
              _genderField(),
              sizedBoxHeight(20),
              FormContainerWidget(
                hintText: phoneNo,
                inputType: TextInputType.phone,
                controller: employeeDetailsController.phoneNoController,
                maxLength: 10,
              ),
              sizedBoxHeight(20),
              FormContainerWidget(
                hintText: emailId,
                controller: employeeDetailsController.emailController,
                inputType: TextInputType.emailAddress,
              ),
              sizedBoxHeight(20),
              FormContainerWidget(
                controller: employeeDetailsController.dobController,
                hintText: dob,
                isCalenderShow: true,
                onTap: () {
                  showDatePickerDailog();
                },
                tfOnClick: () {
                  showDatePickerDailog();
                },
              ),
              sizedBoxHeight(40),
              TopicTitleView(title: qualification),
              sizedBoxHeight(20),
              _dropDownPG(),
              sizedBoxHeight(20),
              _dropDownUG(),
              sizedBoxHeight(20),
              _dropDownHSC(),
              sizedBoxHeight(20),
              _dropDownSSC(),
              sizedBoxHeight(40),
              TopicTitleView(title: workPreference),
              sizedBoxHeight(20),
              const SubTitleView(title: location),
              sizedBoxHeight(10),
              _checkBoxField(),
              sizedBoxHeight(20),
              const SubTitleView(title: shift),
              sizedBoxHeight(10),
              _dropDownShiftField(),
              sizedBoxHeight(30),
              const SubTitleView(title: typeOfEmpl),
              sizedBoxHeight(10),
              _dropDownEmpTypeField(),
              sizedBoxHeight(20),
              _toggleField(),
              sizedBoxHeight(60),
            ],
          ),
        ),
      ),
    );
  }

  Widget _dropDownHSC() {
    return dropDownField(
        initialValues: hsc,
        listItems: employeeDetailsController.itemsHSC,
        controller: employeeDetailsController.hscPercController,
        dropValues: employeeDetailsController.dropdownvalueHSC!.value,
        onChange: (value) {
          employeeDetailsController.dropdownvalueHSC!.value = value.toString();
          setState(() {});
        });
  }

  Widget _dropDownSSC() {
    return dropDownField(
        initialValues: ssc,
        listItems: employeeDetailsController.itemsSSC,
        controller: employeeDetailsController.sscPercController,
        dropValues: employeeDetailsController.dropdownvalueSSC!.value,
        onChange: (value) {
          employeeDetailsController.dropdownvalueSSC!.value = value.toString();
          setState(() {});
        });
  }

  Widget _dropDownPG() {
    return dropDownField(
        initialValues: postGraduation,
        listItems: employeeDetailsController.items,
        controller: employeeDetailsController.pgPercController,
        dropValues: employeeDetailsController.dropdownvalue,
        onChange: (value) {
          employeeDetailsController.dropdownvalue = value.toString();
          setState(() {});
        });
  }

  Widget _dropDownUG() {
    return dropDownField(
        initialValues: graduation,
        listItems: employeeDetailsController.itemsUG,
        controller: employeeDetailsController.ugPercController,
        dropValues: employeeDetailsController.dropdownvalueUG,
        onChange: (value) {
          employeeDetailsController.dropdownvalueUG = value.toString();
          setState(() {});
        });
  }

  Widget _toggleField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          TextView(
            title: availOnWeekends,
            textStyle: availWeekends,
          ),
          Switch(
            value: employeeDetailsController.switchValue!.value,
            onChanged: (value) {
              employeeDetailsController.switchValue!.value = value;
              setState(() {});
            },
          ),
        ],
      ),
    );
  }

  Widget _dropDownShiftField() {
    return DropDownView(
      items: employeeDetailsController.shiftItems,
      dropdownvalue: employeeDetailsController.dropdownvalueShift!.value,
      onChanged: (value) {
        employeeDetailsController.dropdownvalueShift!.value = value.toString();
        setState(() {});
      },
    );
  }

  Widget _dropDownEmpTypeField() {
    return DropDownView(
      items: employeeDetailsController.employementType,
      dropdownvalue: employeeDetailsController.dropdownvalueEmplType!.value,
      onChanged: (value) {
        employeeDetailsController.dropdownvalueEmplType!.value =
            value.toString();
        setState(() {});
      },
    );
  }

  Widget _genderField() {
    return Row(
      children: [
        Flexible(
          child: RadioButtonView(
            title: "Male",
            value: "male",
            groupValue: employeeDetailsController.groupValue != null
                ? employeeDetailsController.groupValue!.value
                : null,
            onChanged: (value) {
              employeeDetailsController.groupValue!.value = value!;
              setState(() {});
            },
          ),
        ),
        Flexible(
          child: RadioButtonView(
            title: female,
            value: "female",
            groupValue: employeeDetailsController.groupValue != null
                ? employeeDetailsController.groupValue!.value
                : null,
            onChanged: (value) {
              employeeDetailsController.groupValue!.value = value!;
              setState(() {});
            },
          ),
        ),
      ],
    );
  }

  Widget _checkBoxField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LocationCheckBoxView(
            checkBoxValue: employeeDetailsController.wfh!.value,
            onChanged: (value) {
              employeeDetailsController.wfh!.value = value!;
              employeeDetailsController.wfo!.value = false;
              employeeDetailsController.hybrid!.value = false;
              setState(() {});
            },
            textTitle: wfh,
          ),
          LocationCheckBoxView(
            checkBoxValue: employeeDetailsController.wfo!.value,
            onChanged: (value) {
              employeeDetailsController.wfo!.value = value!;
              employeeDetailsController.wfh!.value = false;
              employeeDetailsController.hybrid!.value = false;

              setState(() {});
            },
            textTitle: wfo,
          ),
          LocationCheckBoxView(
            checkBoxValue: employeeDetailsController.hybrid!.value,
            onChanged: (value) {
              employeeDetailsController.hybrid!.value = value!;
              employeeDetailsController.wfo!.value = false;
              employeeDetailsController.wfh!.value = false;
              setState(() {});
            },
            textTitle: hybrid,
          ),
        ],
      ),
    );
  }

  showDatePickerDailog() async {
    var date = await showDatePicker(
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
        context: context);

    if (date != null) {
      print(date);
      String dateTime = dateFormat.format(date);
      print(dateTime);
      employeeDetailsController.dobController.text = dateTime;
    }
  }
}
