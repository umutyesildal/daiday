import 'package:local_storage/local_storage.dart';

import 'entities/daylog_entity.dart';

// abstract class so that bloc can reach and we can create new methods in another class.
abstract class DaylogStorage {
  Future<DaylogStorage> init();
  Future putDaylog({required DaylogHiveEntity daylogHiveEntity});
  Future putMood({required String mood});
  Future putActivities({required Activities activities});
  Future putName({required String name});
  Future<String?> getName();
  Future<List<DaylogHiveEntity>?> getDaylogs();
  Future<List<Activities>?> getActivities();
  Future<List<String>?> getMoods();
  Future deleteDaylog();
  Future deleteName();
  Future<String?> deleteMood({required String mood});
  Future<String?> deleteActivities({required Activities activity});

  Future checkName();

  void close();
}
