import 'package:assignment_task_employee_details/core/strings.dart';
import 'package:assignment_task_employee_details/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../core/params/employee_details_request_params.dart';
import '../core/universal_funtions.dart';

class EmployeeDetailsController extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController pgPercController = TextEditingController();
  TextEditingController ugPercController = TextEditingController();
  TextEditingController sscPercController = TextEditingController();
  TextEditingController hscPercController = TextEditingController();
  String? dropdownvalue;
  String? dropdownvalueUG;
  RxString? dropdownvalueSSC = "SSC".obs;
  RxString? dropdownvalueHSC = "HSC".obs;
  RxString? dropdownvalueShift = "Select Shift".obs;
  RxString? dropdownvalueEmplType = "Empolyment Type".obs;
  RxString? groupValue = "".obs;
  RxBool? wfo = false.obs;
  RxBool? wfh = false.obs;
  RxBool? hybrid = false.obs;
  RxBool? switchValue = false.obs;
  late final Box boxEmployeeDetails;
  RxBool boxHasValue = false.obs;
  Rx<EmployeeDetailsParams> employeeDetailsParams = EmployeeDetailsParams().obs;
  RxInt updateIndex = 0.obs;
  RxBool isUpdate = false.obs;

  var items = [
    'Post Graduation',
    'PGMA',
    'PGMCOM',
    'PGMSC',
  ];
  var itemsUG = [
    'Graduation',
    'BA',
    'BCOM',
    'BSC',
  ];
  var itemsSSC = [
    'SSC',
  ];
  var itemsHSC = [
    'HSC',
  ];
  var shiftItems = [
    "Select Shift",
    "1st shift",
    "2nd shift",
    "3rd shift",
  ];
  var employementType = [
    "Empolyment Type",
    "Part Time",
    "Full Time",
    "Weekends",
  ];

  @override
  void onInit() {
    super.onInit();
    print("onInit called");
    callAPIs();
  }

  @override
  void dispose() {
    print("dispose called");
    Hive.close();
    super.dispose();
  }

  @override
  void onReady() {
    print("onReady called");
    super.onReady();
  }

  @override
  void onClose() {
    print("onClose called");
    super.onClose();
  }

  callAPIs() async {
    Hive.registerAdapter(EmployeeDetailsParamsAdapter());
    boxEmployeeDetails = await Hive.openBox('employee_details');

    print("boxEmployeeDetails.isOpen ${boxEmployeeDetails.isOpen}");
    if (boxEmployeeDetails.length > 0) {
      boxHasValue.value = true;
    }
  }

  setValues() {
    try {
      var emp = employeeDetailsParams.value;
      if (emp.firstName != null && emp.lastName != null) {
        firstNameController.text = emp.firstName!;
        lastNameController.text = emp.lastName!;

        if (emp.gender != null) {
          groupValue!.value = emp.gender!;
        }
        if (emp.phoneNumber != null) {
          phoneNoController.text = emp.phoneNumber!;
        }
        if (emp.emailId != null) {
          emailController.text = emp.emailId!;
        }
        if (emp.dob != null) {
          dobController.text = emp.dob!;
        }
        if (emp.postGraduation != null) {
          dropdownvalue = emp.postGraduation;
        }
        if (emp.postGraduationPercentage != null) {
          pgPercController.text = emp.postGraduationPercentage!;
        }
        if (emp.graduation != null) {
          dropdownvalueUG = emp.graduation;
        }
        if (emp.graduationPercentage != null) {
          ugPercController.text = emp.graduationPercentage!;
        }
        if (emp.hsc != null) {
          dropdownvalueHSC!.value = emp.hsc!;
        }
        if (emp.hscPercentage != null) {
          hscPercController.text = emp.hscPercentage!;
        }
        if (emp.ssc != null) {
          dropdownvalueSSC!.value = emp.ssc!;
        }
        if (emp.sscPercentage != null) {
          sscPercController.text = emp.sscPercentage!;
        }
        if (emp.locationWorkPeref != null) {
          if (emp.locationWorkPeref == "WFH") {
            wfh!.value = true;
          } else if (emp.locationWorkPeref == "WFO") {
            wfo!.value = true;
          } else {
            hybrid!.value = true;
          }
        }
        if (emp.shift != null) {
          dropdownvalueShift!.value = emp.shift!;
        }
        if (emp.typeOfEmployement != null) {
          dropdownvalueEmplType!.value = emp.typeOfEmployement!;
        }
        switchValue!.value = emp.availableOnWeekends!;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  onSubmitBtn() async {
    try {
      var data = _onSubmit();
      if (data.isNotEmpty) {
        Get.snackbar(data, "",
            snackPosition: SnackPosition.BOTTOM,
            snackStyle: SnackStyle.GROUNDED,
            barBlur: 50.0);
      } else {
        String locationWorkPreference;
        if (wfh!.value) {
          locationWorkPreference = "WFH";
        } else if (wfo!.value) {
          locationWorkPreference = "WFO";
        } else {
          locationWorkPreference = "Hybrid";
        }
        EmployeeDetailsParams employeeDetailsParams = EmployeeDetailsParams(
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          gender: groupValue!.value,
          phoneNumber: phoneNoController.text,
          emailId: emailController.text,
          dob: dobController.text,
          postGraduation: dropdownvalue,
          postGraduationPercentage: pgPercController.text,
          graduation: dropdownvalueUG,
          graduationPercentage: ugPercController.text,
          hsc: dropdownvalueHSC!.value,
          hscPercentage: hscPercController.text,
          ssc: dropdownvalueSSC!.value,
          sscPercentage: sscPercController.text,
          locationWorkPeref: locationWorkPreference,
          shift: dropdownvalueShift!.value,
          typeOfEmployement: dropdownvalueEmplType!.value,
          availableOnWeekends: switchValue!.value,
          createdOn: isUpdate.value ? null : DateTime.now(),
          updatedOn: DateTime.now(),
        );
        print("boxHasValue.value ${boxHasValue.value}");
        print("updateIndex.value ${updateIndex.value}");
        if (isUpdate.value) {
          boxEmployeeDetails.putAt(updateIndex.value, employeeDetailsParams);
          isUpdate.value = false;
        } else {
          boxEmployeeDetails.add(employeeDetailsParams);
        }
        clearAllData();
        await Future.delayed(const Duration(seconds: 1));

        Get.to(const HomePage());
      }
    } catch (e) {
      print(e.toString());
    }
  }

  String _onSubmit() {
    if (firstNameController.text.isEmpty) {
      return "Enter first name";
    }
    if (lastNameController.text.isEmpty) {
      return "Enter last name";
    }
    if (groupValue == null) {
      return "Select Gender";
    }
    if (phoneNoController.text.isEmpty) {
      return "Enter phone no";
    } else {
      if (phoneNoController.text.length < 10) {
        return "Enter valid phone no";
      }
    }

    if (emailController.text.isEmpty) {
      return "Enter email_id";
    } else {
      bool validEmail = isEmailValidate(emailController.text);
      if (!validEmail) {
        return "Enter valid email id";
      }
    }
    if (dobController.text.isEmpty) {
      return "Enter dob";
    }
    if (dropdownvalue == null) {
      return "Select PG Course";
    }
    if (dropdownvalueUG == null) {
      return "Select UG Course";
    }
    if (dropdownvalueHSC == null) {
      return "Select HSC Course";
    }
    if (dropdownvalueSSC == null) {
      return "Select SSC Course";
    }

    if (pgPercController.text.isEmpty) {
      return "Enter PG Marks";
    }
    if (ugPercController.text.isEmpty) {
      return "Enter UG Marks";
    }
    if (hscPercController.text.isEmpty) {
      return "Enter HSC Marks";
    }
    if (sscPercController.text.isEmpty) {
      return "Enter SSC Marks";
    }
    if (!wfh!.value && !wfo!.value && !hybrid!.value == false) {
      return "Select location";
    }
    if (dropdownvalueShift!.value == "Select Shift") {
      return "Select shift";
    }
    if (dropdownvalueEmplType!.value == "Empolyment Type") {
      return "Select employment type";
    }
    if (!switchValue!.value) {
      return "Select available weekends";
    }
    return "";
  }

  clearAllData() {
    firstNameController.clear();
    lastNameController.clear();
    groupValue!.value = "";
    phoneNoController.clear();
    emailController.clear();
    dobController.clear();
    dropdownvalue = null;
    dropdownvalueUG = null;
    dropdownvalueHSC = "HSC".obs;
    dropdownvalueSSC = "SSC".obs;
    pgPercController.clear();
    ugPercController.clear();
    hscPercController.clear();
    sscPercController.clear();
    wfh!.value = false;
    wfo!.value = false;
    hybrid!.value == false;
    dropdownvalueShift!.value = "Select Shift";
    dropdownvalueEmplType!.value = "Empolyment Type";
    switchValue!.value = false;
    isUpdate.value = false;
  }
}
