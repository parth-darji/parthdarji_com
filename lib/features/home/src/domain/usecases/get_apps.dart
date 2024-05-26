import '../entities/page.dart';
import '../repositories/app_repository.dart';

class GetApps {
  final AppRepository repository;

  GetApps(this.repository);

  Future<List<DrawerPage>> call() async {
    return await repository.getApps();
  }
}
