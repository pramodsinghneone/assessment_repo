import 'package:assignment_task_employee_details/core/widgets/common_text.dart';
import 'package:assignment_task_employee_details/view_model/employee_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../core/params/employee_details_request_params.dart';

import 'home_page/components/list_body_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final Box employeeBox;

  @override
  void initState() {
    super.initState();

    openBox();
  }

  openBox() async {
    employeeBox = Hive.box('employee_details');
    print("employeeBox Length ${employeeBox.length}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextView(
          title: "Employee Details List",
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.find<EmployeeDetailsController>().clearAllData();
            Get.back();
          },
        ),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
          valueListenable: employeeBox.listenable(),
          builder: (context, Box box, widget) {
            if (box.isEmpty) {
              return const Center(child: TextView(title: "No Data found"));
            } else {
              return ListView.builder(
                itemCount: box.length,
                itemBuilder: (context, index) {
                  EmployeeDetailsParams employeeData = box.getAt(index);
                  return ListBodyView(
                      employeeDetailsParams: employeeData, index: index + 1);
                },
              );
            }
          }),
    );
  }
}
