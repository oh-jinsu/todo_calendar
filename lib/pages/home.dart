import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo/theme/color.dart';
import 'package:todo/widgets/calendar.dart';
import 'package:todo/widgets/calendar_header.dart';

import '../functions/date.dart';

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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: Flexible(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.4,
                ),
                child: SingleChildScrollView(
                  child: Calendar(
                    year: year,
                    month: month,
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
                          padding: const EdgeInsets.all(1.0),
                          color: Colors.transparent,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 3.0,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2.0),
                                  border: Border.all(
                                    color: Theme.of(context).dividerColor,
                                    width: 0.5,
                                  ),
                                ),
                                child: Center(
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
                              ),
                              const SizedBox(height: 2.0),
                              GridView.count(
                                padding: const EdgeInsets.all(0.0),
                                physics: const NeverScrollableScrollPhysics(),
                                crossAxisCount: 4,
                                shrinkWrap: true,
                                mainAxisSpacing: 2.0,
                                crossAxisSpacing: 2.0,
                                children: [
                                  for (int i = 0; i < min(index, 10); i++)
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(2.0),
                                        color: i >= 3 && index % 4 == 0
                                            ? Colors.red[100]
                                            : Colors.green[100],
                                      ),
                                    )
                                ],
                              ),
                              const SizedBox(height: 1.0),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
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
                    "${selected.day.toString()}일 ${formatWeekDay(selected.weekday)}요일",
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
