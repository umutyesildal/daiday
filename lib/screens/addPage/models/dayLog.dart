import 'package:daiday/screens/addPage/models/activities.dart';
import 'package:daiday/screens/addPage/models/notesAndPhotos.dart';
import 'package:hive/hive.dart';
import 'mood.dart';

part 'dayLog.g.dart';

@HiveType(typeId: 0)
class DayLog {
  @HiveField(0)
  Mood mood;
  @HiveField(1)
  DateTime date;
  @HiveField(2)
  List<Activities> activities;
  @HiveField(3)
  NotesAndPhotos notesAndPhotos;
  DayLog({
    required this.mood,
    required this.date,
    required this.activities,
    required this.notesAndPhotos,
  });
}
