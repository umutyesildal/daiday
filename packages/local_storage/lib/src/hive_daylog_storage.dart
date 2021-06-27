import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:local_storage/src/daylog_storage.dart';
import 'package:local_storage/src/entities/hive_type_ids.dart';
import 'package:local_storage/src/entities/daylog_entity.dart';
import 'entities/activities_entity.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class HiveDaylogStorage implements DaylogStorage {
  static Box? _hiveBox;
  static String boxName = 'logs';
  static String currentDaylogKey = 'CurrentDaylogKey';

  @override
  Future<HiveDaylogStorage> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter<Activities>(ActivitiesAdapter());
    Hive.registerAdapter<DaylogHiveEntity>(DaylogHiveEntityAdapter());
    _hiveBox ??= await Hive.openBox<DaylogHiveEntity>(boxName);
    return this;
  }

  Future putDaylog({required DaylogHiveEntity daylogHiveEntity}) async {
    try {
      await _hiveBox!.add(daylogHiveEntity);
    } catch (e) {
      throw e;
    }
  }

  Future<List<DaylogHiveEntity>?> getDaylogs() async {
    try {
      List<DaylogHiveEntity>? daylogHiveEntity = await _hiveBox!.get('logs');
    } catch (e) {
      throw e;
    }
  }

  @override
  Future deleteDaylog() async {
    try {
      await _hiveBox!.delete(currentDaylogKey);
    } catch (e) {
      throw e;
    }
  }

  @override
  void close() {
    _hiveBox!.compact();
    _hiveBox!.close();
  }
}
