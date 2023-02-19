import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo/pages/list.dart';
import 'package:todo/widgets/calendar.dart';
import 'package:todo/widgets/calendar_cell.dart';
import 'package:todo/widgets/calendar_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int year = 2023;

  int month = 2;

  DateTime selectedDate = DateTime.now().toLocal();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${year.toString()}년 ${month.toString()}월",
        ),
      ),
      body: Column(
        children: [
          const CalendarHeader(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: Calendar(
              year: year,
              month: month,
              builder: (date, index) {
                return CalendarCell(
                  date: date,
                  selectedDate: selectedDate,
                  onTap: () {
                    if (date.month != month) {
                      return;
                    }

                    setState(() {
                      selectedDate = date;
                    });

                    // showModalBottomSheet(
                    //   context: context,
                    //   builder: (context) {
                    //     return ListPage(
                    //       year: date.year,
                    //       month: date.month,
                    //       day: date.day,
                    //     );
                    //   },
                    //   // isScrollControlled: true,
                    //   barrierColor: Colors.black.withOpacity(.2),
                    //   clipBehavior: Clip.hardEdge,
                    //   shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(20.0),
                    //   ),
                    // );

                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ListPage(
                          year: date.year,
                          month: date.month,
                          day: date.day,
                        ),
                      ),
                    );
                  },
                  children: [
                    for (int i = 0; i < min(index, 10); i++)
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.0),
                          color: i >= 3 && index % 4 == 0
                              ? const Color(0xFFFFCDD2)
                              : const Color(0xFFBBDEFB),
                        ),
                      )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
