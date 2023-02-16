import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo/widgets/calendar.dart';
import 'package:todo/widgets/calendar_cell.dart';
import 'package:todo/widgets/calendar_header.dart';

import '../functions/date.dart';

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
        centerTitle: false,
        title: Text(
          "${year.toString()}년 ${month.toString()}월",
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          const CalendarHeader(),
          Flexible(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.4,
              ),
              child: SingleChildScrollView(
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
                      },
                      children: [
                        for (int i = 0; i < min(index, 10); i++)
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2.0),
                              color: i >= 3 && index % 4 == 0
                                  ? Colors.red[100]
                                  : Colors.blue[100],
                            ),
                          )
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 16.0, 12.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "${selectedDate.day.toString()}일 ${formatWeekDay(selectedDate.weekday)}요일",
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
