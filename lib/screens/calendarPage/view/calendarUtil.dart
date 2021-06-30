import 'dart:collection';
import 'package:intl/intl.dart';

import 'package:local_storage/local_storage.dart';
import 'package:table_calendar/table_calendar.dart';

// Example event class.
class Event {
  final String title;

  const Event(this.title);

  @override
  String toString() => title;
}

// This is used in calendarPage.
LinkedHashMap<DateTime, List<Event>> _getEvents(List<DaylogHiveEntity> logs) {
  final _eventSource2 = Map.fromIterable(logs,
      key: (item) => DateFormat("dd/MM/yyyy").parse(item.date),
      value: (item) => List.generate(1, (index) => Event(item.mood)));

  final events = LinkedHashMap<DateTime, List<Event>>(
    equals: isSameDay,
    hashCode: getHashCode,
  )..addAll(_eventSource2);

  return events;
}

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

// Returns a list of DateTime objects.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
    (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}
