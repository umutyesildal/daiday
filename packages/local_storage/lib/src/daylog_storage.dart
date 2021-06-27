import 'entities/daylog_entity.dart';

abstract class DaylogStorage {
  Future<DaylogStorage> init();
  Future putDaylog({required DaylogHiveEntity daylogHiveEntity});
  Future<List<DaylogHiveEntity>?> getDaylogs();
  Future deleteDaylog();
  void close();
}
