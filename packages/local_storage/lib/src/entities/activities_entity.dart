import 'package:hive/hive.dart';
part 'activities_entity.g.dart';

@HiveType(typeId: 2)
class Activities {
  @HiveField(0)
  String activity;
  @HiveField(1)
  String emoji;
  Activities({required this.activity, required this.emoji});
}
