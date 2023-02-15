import 'package:flutter/material.dart';

class CalendarHeader extends StatelessWidget {
  const CalendarHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < 7; i++)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 8.0),
              child: Center(
                child: Text(
                  ["월", "화", "수", "목", "금", "토", "일"][i].toString(),
                  style: const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
