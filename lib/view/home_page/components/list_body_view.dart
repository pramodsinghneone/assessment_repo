import 'package:assignment_task_employee_details/view/emp_detail_page/emp_detail_page.dart';
import 'package:assignment_task_employee_details/view/home_page/components/option_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../core/constants.dart';
import '../../../core/params/employee_details_request_params.dart';
import '../../../core/textstyles.dart';
import '../../../core/universal_funtions.dart';
import '../../../core/widgets/common_text.dart';
import '../../../view_model/employee_page_controller.dart';
import '../../emp_form_page/emp_form_page.dart';

class ListBodyView extends StatefulWidget {
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
  State<ListBodyView> createState() => _ListBodyViewState();
}

class _ListBodyViewState extends State<ListBodyView> {
  late final Box box;
  @override
  void initState() {
    super.initState();
    box = Hive.box("employee_details");
  }

  @override
  Widget build(BuildContext context) {
    String? createdOn;
    String? updatedOn;
    if (widget.employeeDetailsParams!.createdOn != null) {
      var dateTime = widget.employeeDetailsParams!.createdOn;
      createdOn = dateFormatWithTime.format(dateTime!);
    } else {
      var dateTime = widget.employeeDetailsParams!.updatedOn;
      updatedOn = dateFormatWithTime.format(dateTime!);
    }

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Slidable(
        key: const ValueKey(0),
        endActionPane: ActionPane(
          dismissible: DismissiblePane(onDismissed: () {}),
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(1),
              autoClose: true,
              flex: 1,
              backgroundColor: redColor,
              foregroundColor: whiteColor,
              icon: Icons.delete,
              label: "Delete",
              onPressed: (value) {
                try {
                  box.deleteAt(widget.index! - 1);
                  if (box.isEmpty) {
                    Get.find<EmployeeDetailsController>().boxHasValue.value =
                        false;
                  }
                } catch (e) {
                  print(e.toString());
                }
              },
            ),
            SlidableAction(
              borderRadius: BorderRadius.circular(1),
              autoClose: true,
              flex: 1,
              backgroundColor: Colors.blueAccent,
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: 'Edit',
              onPressed: (value) {
                Get.find<EmployeeDetailsController>()
                    .employeeDetailsParams
                    .value = widget.employeeDetailsParams!;
                Get.find<EmployeeDetailsController>().updateIndex.value =
                    widget.index! - 1;
                Get.find<EmployeeDetailsController>().isUpdate.value = true;

                Get.to(const EmployeeFormPage());
              },
            ),
          ],
        ),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: ListTile(
            onLongPress: () {
              _showOptionDialog();
            },
            onTap: () {
              Get.to(EmployeeDetailPage(
                  employeeDetailsParams: widget.employeeDetailsParams,
                  index: widget.index));
            },
            leading: const Icon(
              Icons.person,
              size: 30,
            ),
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextView(
                title:
                    "${widget.employeeDetailsParams!.firstName} ${widget.employeeDetailsParams!.lastName}",
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
                      employeeDetailsParams: widget.employeeDetailsParams,
                      index: widget.index));
                },
                child: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 17.0,
                )),
          ),
        ),
      ),
    );
  }

  _showOptionDialog() {
    Get.dialog(OptionItems(
        employeeDetailsParams: widget.employeeDetailsParams,
        index: widget.index));
  }
}
