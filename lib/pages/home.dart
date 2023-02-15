import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo/theme/color.dart';
import 'package:todo/widgets/calendar.dart';
import 'package:todo/widgets/calendar_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final year = 2023;

  final month = 2;

  DateTime selected = DateTime.now().toLocal();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "${year.toString()}년 ${month.toString()}월",
        ),
      ),
      body: Column(
        children: [
          const CalendarHeader(),
          const Divider(height: 1.0),
          Expanded(
            child: SingleChildScrollView(
              child: Calendar(
                year: year,
                month: month,
                borderSide: const BorderSide(
                  color: Colors.transparent,
                ),
                builder: (date, index) {
                  return GestureDetector(
                    onTap: () {
                      if (date.month != month) {
                        return;
                      }

                      setState(() {
                        selected = date;
                      });
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
                            child: Text(
                              date.day.toString(),
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: selected.day == date.day
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                color: selected.day == date.day
                                    ? Colors.green[400]
                                    : ColorTheme.body,
                              ),
                            ),
                          ),
                          GridView.count(
                            padding: const EdgeInsets.all(0.0),
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: 3,
                            shrinkWrap: true,
                            mainAxisSpacing: 1.0,
                            crossAxisSpacing: 1.0,
                            children: [
                              for (int i = 0; i < min(index, 3); i++)
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.0),
                                    color: Colors.green[100],
                                  ),
                                )
                            ],
                          ),
                          const SizedBox(height: 2.0),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
