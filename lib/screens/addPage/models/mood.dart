import 'package:hive/hive.dart';
part 'mood.g.dart';

@HiveType(typeId: 2)
class Mood {
  @HiveField(0)
  String mood;
  Mood({
    required this.mood,
  });
}
