import '../entities/page.dart';

abstract class AppRepository {
  Future<List<DrawerPage>> getApps();
}
