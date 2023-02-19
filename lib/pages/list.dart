import 'package:flutter/material.dart';
import 'package:todo/theme/color.dart';
import 'package:todo/widgets/todo_row.dart';

class ListPage extends StatelessWidget {
  final int year;
  final int month;
  final int day;

  const ListPage({
    super.key,
    required this.year,
    required this.month,
    required this.day,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$day일 할 일"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              color: ColorTheme.primary,
            ),
          )
        ],
      ),
      body: ReorderableListView(
        // padding: const EdgeInsets.symmetric(vertical: 16.0),
        onReorder: (o, i) {},
        children: [
          const TodoRow(key: Key("1"), initialValue: "스터디 숙제 제출하기"),
          const TodoRow(key: Key("2"), initialValue: "스터디 숙제 제출하기"),
          const TodoRow(key: Key("3"), initialValue: "스터디 숙제 제출하기"),
        ],
      ),
    );
  }
}
