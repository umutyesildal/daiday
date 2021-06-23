import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:local_storage/src/entities/hive_type_ids.dart';
import 'package:local_storage/src/entities/daylog_entity.dart';

import 'user_storage.dart';

class HiveUserStorage implements DaylogStorage {
  static Box? _hiveBox;
  static String boxName = 'DayLogStorage';
  static String currentUserKey = 'CurrentUser';

  @override
  Future<HiveUserStorage> init() async {
    await Hive.initFlutter();
    if (!Hive.isAdapterRegistered(TypeId.userEntityId))
      Hive.registerAdapter(DaylogHiveEntityAdapter());
    _hiveBox ??= await Hive.openBox<DaylogHiveEntity>(boxName);
    return this;
  }

  Future putUser({required Map<String, dynamic> userMap}) async {
    try {
      DaylogHiveEntity? userHiveEntity = DaylogHiveEntity.fromMap(userMap);
      await _hiveBox!.put(currentUserKey, userHiveEntity);
    } catch (e) {
      throw e;
    }
  }

  Future<Map<String, dynamic>?> getUser() async {
    try {
      DaylogHiveEntity? userHiveEntity = await _hiveBox!.get(currentUserKey);
      return userHiveEntity?.toMap();
    } catch (e) {
      throw e;
    }
  }

  @override
  Future deleteUser() async {
    try {
      await _hiveBox!.delete(currentUserKey);
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
