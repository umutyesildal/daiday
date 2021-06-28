import 'package:local_storage/local_storage.dart';

import 'entities/daylog_entity.dart';

abstract class DaylogStorage {
  Future<DaylogStorage> init();
  Future putDaylog({required DaylogHiveEntity daylogHiveEntity});
  Future<List<DaylogHiveEntity>?> getDaylogs();
  Future<List<Activities>?> getActivities();
  Future<List<String>?> getMoods();
  Future deleteDaylog();
  void close();
}
