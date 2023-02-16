import 'package:flutter/material.dart';
import 'package:todo/theme/color.dart';

class CalendarCell extends StatelessWidget {
  final DateTime date;
  final DateTime? selectedDate;
  final void Function()? onTap;
  final List<Widget> children;

  const CalendarCell({
    super.key,
    required this.date,
    this.selectedDate,
    this.onTap,
    this.children = const [],
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
                color: selectedDate?.day == date.day ? Colors.blue[100] : null,
                borderRadius: BorderRadius.circular(2.0),
                border: Border.all(
                  color: selectedDate?.day == date.day
                      ? Colors.transparent
                      : Theme.of(context).dividerColor,
                  width: 0.5,
                ),
              ),
              child: Center(
                child: Text(
                  date.day.toString(),
                  style: const TextStyle(
                    fontSize: 12.0,
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
              children: children,
            ),
            const SizedBox(height: 1.0),
          ],
        ),
      ),
    );
  }
}
