import 'package:hive_flutter/hive_flutter.dart';

import '../local_storage.dart';

class HiveDataManager {
  static Future<void> initialize() async {
    await Hive.initFlutter();
  }

  static Future<void> saveData<T>({
    required HiveBox hiveBox,
    required String key,
    required T value,
  }) async {
    Box box = await HiveBoxManager.instance.getBox(hiveBox);
    await box.put(key, value);
  }

  static Future<T?> getData<T>({
    required HiveBox hiveBox,
    required String key,
  }) async {
    Box box = await HiveBoxManager.instance.getBox(hiveBox);
    return box.get(key);
  }

  static Future<void> deleteData({
    required HiveBox hiveBox,
    String? key,
  }) async {
    Box box = await HiveBoxManager.instance.getBox(hiveBox);
    if (key == null) {
      await box.clear();
    } else {
      await box.delete(key);
    }
  }
}
