import '../../domain/entities/app.dart';
import '../../domain/entities/page.dart';
import '../../domain/repositories/app_repository.dart';
import '../datasources/local/app_datasources.dart';
import '../models/local/app_model.dart';

class AppRepositoryImpl implements AppRepository {
  final AppsLocalDataSource localDataSource;
  AppRepositoryImpl({required this.localDataSource});

  @override
  Future<List<DrawerPage>> getApps() async {
    final List<AppModel> appModels = await localDataSource.getAppsData();

    final pages = <DrawerPage>[];

    for (AppModel app in appModels) {
      if (pages.isEmpty || pages.last.apps.length >= 24) {
        pages.add(
          DrawerPage(number: pages.length + 1, apps: []),
        );
      }
      pages.last.apps.add(
        App(
          imagePath: app.imagePath,
          appName: app.appName,
          onTap: app.onTap,
        ),
      );
    }

    return pages;
  }
}
