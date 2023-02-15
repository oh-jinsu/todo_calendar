import 'package:flutter/material.dart';
import 'package:todo/functions/date.dart';

final indexes = [0, 1, 2, 3, 4, 5, 6];

class Calendar extends StatelessWidget {
  final int year;
  final int month;
  final Widget Function(DateTime date, int index) builder;
  final BorderSide borderSide;

  const Calendar({
    super.key,
    required this.year,
    required this.month,
    required this.builder,
    this.borderSide = BorderSide.none,
  });

  @override
  Widget build(BuildContext context) {
    final dates = getCalendarDates(year, month).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (int i = 0; i < dates.length / 7; i++)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int j = 0; j < 7; j++)
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: i == 0 ? borderSide : BorderSide.none,
                        bottom: borderSide,
                        right: j != 6 ? borderSide : BorderSide.none,
                      ),
                    ),
                    child: Opacity(
                      opacity: dates[i * 7 + j].month == month ? 1.0 : 0.3,
                      child: builder.call(dates[i * 7 + j], i * 7 + j),
                    ),
                  ),
                ),
            ],
          )
      ],
    );
  }
}
