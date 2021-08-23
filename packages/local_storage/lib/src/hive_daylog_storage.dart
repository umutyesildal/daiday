import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:local_storage/src/daylog_storage.dart';
import 'package:local_storage/src/dummy_data.dart';
import 'package:local_storage/src/entities/daylog_entity.dart';
import 'entities/activities_entity.dart';

class HiveDaylogStorage implements DaylogStorage {
  static Box? _hiveBoxMain;
  static Box? _hiveBoxMood;
  static Box? _hiveBoxActivities;
  static Box? _hiveBoxName;
  static Box? _hiveBoxTheme;
  static String _nameBoxName = 'name';
  static String _mainBoxName = 'logs';
  static String _moodBoxName = 'moods';
  static String _activitiesBoxName = 'activities';
  static String _themeBoxName = 'theme';

// init function to create,populate,update hive database boxes.
  @override
  Future<HiveDaylogStorage> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter<Activities>(ActivitiesAdapter());
    Hive.registerAdapter<DaylogHiveEntity>(DaylogHiveEntityAdapter());
    _hiveBoxMood ??= await Hive.openBox<String>(_moodBoxName);
    _hiveBoxActivities ??= await Hive.openBox<Activities>(_activitiesBoxName);
    _hiveBoxMain ??= await Hive.openBox<DaylogHiveEntity>(_mainBoxName);
    _hiveBoxName ??= await Hive.openBox<String>(_nameBoxName);
    _hiveBoxTheme ??= await Hive.openBox<bool>(_themeBoxName);

    if (_hiveBoxMain!.isEmpty) {
      populateLogs();
    }

    /*   _hiveBoxActivities!.deleteFromDisk();
    _hiveBoxMain!.deleteFromDisk();
    _hiveBoxMood!.deleteFromDisk();
    _hiveBoxName!.deleteFromDisk();
    _hiveBoxTheme!.deleteFromDisk();
*/
    return this;
  }

  Future populateLogs() async {
    _hiveBoxMain!.add(DummyData().logs[0]);
    _hiveBoxTheme!.put(0, false);
    _hiveBoxName!.put(0, 'first');
  }

// putting a new daylog to database.
  Future putDaylog({required DaylogHiveEntity daylogHiveEntity}) async {
    try {
      await _hiveBoxMain!.add(daylogHiveEntity);
    } catch (e) {
      throw e;
    }
  }

  Future putMood({required String mood}) async {
    try {
      await _hiveBoxMood!.add(mood);
    } catch (e) {
      throw e;
    }
  }

  Future putActivities({required Activities activities}) async {
    try {
      await _hiveBoxActivities!.add(activities);
    } catch (e) {
      throw e;
    }
  }

  Future putName({required String name}) async {
    try {
      await _hiveBoxName!.put(0, name);
    } catch (e) {
      throw e;
    }
  }

  Future<String> getName() async {
    try {
      String name = await _hiveBoxName!.getAt(0);
      return name;
    } catch (e) {
      throw e;
    }
  }

  Future putTheme({required bool theme}) async {
    try {
      await _hiveBoxTheme!.put(0, theme);
    } catch (e) {
      throw e;
    }
  }

  Future<bool> getTheme() async {
    try {
      bool theme = await _hiveBoxTheme!.getAt(0);
      return theme;
    } catch (e) {
      throw e;
    }
  }

// getting all the daylogs from database.
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
      // await _hiveBoxMain!.delete(0);
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<String?> deleteMood({required String mood}) async {
    try {
      await _hiveBoxMood!.delete(mood);
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<String?> deleteActivities({required Activities activity}) async {
    try {
      await _hiveBoxMood!.delete(activity);
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
