part of local_storage;

enum HiveBox {
  user,
  common,
  // Add more box names as needed
}

class HiveBoxManager {
  static HiveBoxManager? _instance;

  HiveBoxManager._internal();

  static HiveBoxManager get instance {
    _instance ??= HiveBoxManager._internal();
    return _instance!;
  }

  Box? user;
  Box? common;
  // Define more box variables as needed

  Future<Box> getBox(HiveBox hiveBox) async {
    switch (hiveBox) {
      case HiveBox.user:
        user ??= await Hive.openBox(hiveBox.name);
        return user!;
      case HiveBox.common:
        common ??= await Hive.openBox(hiveBox.name);
        return common!;
      default:
        throw AssertionError(
            'You need to create a box object in HiveBoxManager for $hiveBox');
    }
  }
}
