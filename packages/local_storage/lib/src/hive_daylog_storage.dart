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
  static String _nameBoxName = 'name';
  static String _mainBoxName = 'logs';
  static String _moodBoxName = 'moods';
  static String _activitiesBoxName = 'activities';

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

    if (_hiveBoxMain!.isEmpty) {
      populateLogs();
    }
    if (_hiveBoxMood!.isEmpty) {
      populateMood();
    }
    if (_hiveBoxActivities!.isEmpty) {
      populateActivities();
    }

    /*   _hiveBoxActivities!.deleteFromDisk();
    _hiveBoxMain!.deleteFromDisk();
    _hiveBoxMood!.deleteFromDisk();
*/
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
      await _hiveBoxName!.add(name);
    } catch (e) {
      throw e;
    }
  }

  Future deleteName() async {
    try {
      await _hiveBoxName!.deleteAt(0);
    } catch (e) {
      throw e;
    }
  }

  Future checkName() async {
    try {
      String checkName = await _hiveBoxName!.getAt(0);
      return checkName;
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
