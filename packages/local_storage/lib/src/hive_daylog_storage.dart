import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:local_storage/src/daylog_storage.dart';
import 'package:local_storage/src/dummy_data.dart';
import 'package:local_storage/src/entities/hive_type_ids.dart';
import 'package:local_storage/src/entities/daylog_entity.dart';
import 'entities/activities_entity.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class HiveDaylogStorage implements DaylogStorage {
  static Box? _hiveBoxMain;
  static Box? _hiveBoxMood;
  static Box? _hiveBoxActivities;
  static String _mainBoxName = 'logs';
  static String _moodBoxName = 'moods';
  static String _activitiesBoxName = 'activities';
  static String currentDaylogKey = 'CurrentDaylogKey';

  @override
  Future<HiveDaylogStorage> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter<Activities>(ActivitiesAdapter());
    Hive.registerAdapter<DaylogHiveEntity>(DaylogHiveEntityAdapter());
    _hiveBoxMood ??= await Hive.openBox<String>(_moodBoxName);
    _hiveBoxActivities ??= await Hive.openBox<Activities>(_activitiesBoxName);
    _hiveBoxMain ??= await Hive.openBox<DaylogHiveEntity>(_mainBoxName);
    if (_hiveBoxMain!.isEmpty) {
      populateLogs();
    }
    if (_hiveBoxMood!.isEmpty) {
      populateMood();
    }
    if (_hiveBoxActivities!.isEmpty) {
      populateActivities();
    }

    return this;
  }

  Future populateLogs() async {
    for (int i = 0; i < DummyData().logs.length; i++) {
      _hiveBoxMain!.add(DummyData().logs[i]);
      print(DummyData().logs[i]);
    }
  }

  Future populateMood() async {
    for (int i = 0; i < DummyData().moods.length; i++) {
      _hiveBoxMood!.add(DummyData().moods[i]);
      print(DummyData().moods[i]);
    }
  }

  Future populateActivities() async {
    for (int i = 0; i < DummyData().activities.length; i++) {
      _hiveBoxActivities!.add(DummyData().activities[i]);
      print(DummyData().activities[i]);
    }
  }

  Future putDaylog({required DaylogHiveEntity daylogHiveEntity}) async {
    try {
      await _hiveBoxMain!.add(daylogHiveEntity);
    } catch (e) {
      throw e;
    }
  }

  Future<List<DaylogHiveEntity>?> getDaylogs() async {
    try {
      List<DaylogHiveEntity>? daylogHiveEntity =
          List.from(_hiveBoxMain!.values);
      return daylogHiveEntity;
    } catch (e) {
      throw e;
    }
  }

  Future<List<Activities>?> getActivities() async {
    try {
      List<Activities>? activities = List.from(_hiveBoxActivities!.values);
      return activities;
    } catch (e) {
      throw e;
    }
  }

  Future<List<String>?> getMoods() async {
    try {
      List<String>? moods = List.from(_hiveBoxMood!.values);
      return moods;
    } catch (e) {
      throw e;
    }
  }

  @override
  Future deleteDaylog() async {
    try {
      await _hiveBoxMain!.delete(currentDaylogKey);
    } catch (e) {
      throw e;
    }
  }

  @override
  void close() {
    _hiveBoxMain!.compact();
    _hiveBoxMain!.close();
  }
}
