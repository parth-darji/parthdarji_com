import 'package:parthdarji_com/core/resources/src/assets.dart';

import '../../models/local/app_model.dart';

abstract class AppsLocalDataSource {
  Future<List<AppModel>> getAppsData();
}

class AppIconLocalDataSourceImpl implements AppsLocalDataSource {
  @override
  Future<List<AppModel>> getAppsData() async {
    List<AppModel> apps = <AppModel>[
      AppModel(
        imagePath: assets.svg.appStore,
        appName: "App Store",
        onTap: () {
          // TODO: implement navigation
        },
      ),
      AppModel(
        imagePath: assets.svg.calendar,
        appName: "Calendar",
        onTap: () {
          // TODO: implement navigation
        },
      ),
      AppModel(
        imagePath: assets.svg.camera,
        appName: "Camera",
        onTap: () {
          // TODO: implement navigation
        },
      ),
      AppModel(
        imagePath: assets.svg.clock,
        appName: "Clock",
        onTap: () {
          // TODO: implement navigation
        },
      ),
      AppModel(
        imagePath: assets.svg.health,
        appName: "Health",
        onTap: () {
          // TODO: implement navigation
        },
      ),
      AppModel(
        imagePath: assets.svg.home,
        appName: "Home",
        onTap: () {
          // TODO: implement navigation
        },
      ),
      AppModel(
        imagePath: assets.svg.mail,
        appName: "Mail",
        onTap: () {
          // TODO: implement navigation
        },
      ),
      AppModel(
        imagePath: assets.svg.maps,
        appName: "Maps",
        onTap: () {
          // TODO: implement navigation
        },
      ),
      AppModel(
        imagePath: assets.svg.messages,
        appName: "Messages",
        onTap: () {
          // TODO: implement navigation
        },
      ),
      AppModel(
        imagePath: assets.svg.music,
        appName: "Music",
        onTap: () {
          // TODO: implement navigation
        },
      ),
      AppModel(
        imagePath: assets.svg.notes,
        appName: "Notes",
        onTap: () {
          // TODO: implement navigation
        },
      ),
      AppModel(
        imagePath: assets.svg.phone,
        appName: "Phone",
        onTap: () {
          // TODO: implement navigation
        },
      ),
      AppModel(
        imagePath: assets.svg.photos,
        appName: "Photos",
        onTap: () {
          // TODO: implement navigation
        },
      ),
      AppModel(
        imagePath: assets.svg.reminders,
        appName: "Reminders",
        onTap: () {
          // TODO: implement navigation
        },
      ),
      AppModel(
        imagePath: assets.svg.safari,
        appName: "Safari",
        onTap: () {
          // TODO: implement navigation
        },
      ),
      AppModel(
        imagePath: assets.svg.settings,
        appName: "Settings",
        onTap: () {
          // TODO: implement navigation
        },
      ),
      AppModel(
        imagePath: assets.svg.wallet,
        appName: "Wallet",
        onTap: () {
          // TODO: implement navigation
        },
      ),
      AppModel(
        imagePath: assets.svg.weather,
        appName: "Weather",
        onTap: () {
          // TODO: implement navigation
        },
      ),
    ];

    return apps;
  }
}
