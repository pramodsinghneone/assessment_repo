import 'package:flutter/material.dart';

class ReorderListView extends StatefulWidget {
  const ReorderListView({Key? key}) : super(key: key);

  @override
  State<ReorderListView> createState() => _ReorderListViewState();
}

class _ReorderListViewState extends State<ReorderListView> {
  List<String> item = [
    "Clients",
    "Designer",
    "Developer",
    "Director",
    "Employee",
    "Manager",
    "Worker",
    "Owner"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.sort_by_alpha),
              tooltip: "Sort",
              onPressed: sorting),
        ],
      ),
      body: ReorderableListView(
          onReorder: reorderData,
          children: item.map((e) {
            return Card(
              color: Colors.blueAccent,
              key: ValueKey(e),
              elevation: 2,
              child: ListTile(
                title: Text(e),
                leading: const Icon(
                  Icons.work,
                  color: Colors.black,
                ),
              ),
            );
          }).toList()),
    );
  }

  void sorting() {
    setState(() {
      item.sort();
    });
  }

  void reorderData(int oldindex, int newindex) {
    setState(() {
      if (newindex > oldindex) {
        newindex -= 1;
      }
      final items = item.removeAt(oldindex);
      item.insert(newindex, items);
    });
  }
}
