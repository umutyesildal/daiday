import 'package:hive/hive.dart';
import 'activities_entity.dart';
import 'hive_type_ids.dart';
part 'daylog_entity.g.dart';

@HiveType(typeId: TypeId.daylogEntityId)
class DaylogHiveEntity extends HiveObject {
  DaylogHiveEntity({
    required this.mood,
    required this.date,
    required this.activities,
    required this.notes,
  });

  @HiveField(0)
  final String mood;
  @HiveField(1)
  final String date;
  @HiveField(2)
  final List<Activities> activities;
  @HiveField(3)
  final String notes;

  Map<String, dynamic> toMap() {
    return {
      'mood': mood,
      'date': date,
      'activities': activities,
      'notes': notes,
    };
  }

  static DaylogHiveEntity? fromMap(Map<String, dynamic>? map) {
    if (map == null) return null;
    if (map.length < 13) {
      print('insufficient number of feilds in user map');
      return null;
    }
    return DaylogHiveEntity(
      mood: map['mood'] ?? '',
      date: map['date'] ?? '',
      activities: map['activities'] ?? '',
      notes: map['notes'] ?? '',
    );
  }
}
