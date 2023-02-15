int getFirstWeekDay(int year, int month) {
  return DateTime(year, month).weekday;
}

String formatWeekDay(int weekDay) {
  return ["월", "화", "수", "목", "금", "토", "일"][weekDay - 1];
}

int getLastDay(int year, int month) {
  final date = DateTime(year, month + 1, 0);

  return date.day;
}

Iterable<DateTime> getCalendarDates(int year, int month) {
  final weekDay = getFirstWeekDay(year, month) - 1;

  final lastDay = getLastDay(year, month);

  final length = ((lastDay + weekDay) / 7).ceil() * 7;

  return Iterable.generate(length, (i) {
    final value = i - weekDay + 1;

    if (value < 1) {
      final lastDay = getLastDay(year, month - 1);

      return DateTime(year, month - 1, lastDay + value);
    }

    if (value > lastDay) {
      return DateTime(year, month + 1, value - lastDay);
    }

    return DateTime(year, month, value);
  });
}
