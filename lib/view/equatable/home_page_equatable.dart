import 'package:assignment_task_employee_details/view/equatable/user_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text("Compare Two Object"),
          onPressed: () {
            compareData();
          },
        ),
      ),
    );
  }

  void compareData() {
    const userDetail_1 = UserDetail(username: 'Shirsh', id: 1);
    const userDetail_2 = UserDetail(username: 'Joy', id: 2);
    const userDetail_3 = UserDetail(username: 'Shirsh', id: 1);

    print(userDetail_1 == userDetail_2); // false
    print(userDetail_1 == userDetail_3); // true
  }
}
