import 'package:hive/hive.dart';
import 'hive_type_ids.dart';

part 'activities_entity.g.dart';

@HiveType(typeId: TypeId.activitiesEntityId)
class Activities {
  @HiveField(0)
  String activity;
  @HiveField(1)
  String emoji;
  Activities({required this.activity, required this.emoji});
}
