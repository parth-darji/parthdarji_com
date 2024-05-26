// lib/injection_container.dart
import 'package:get_it/get_it.dart';

import '../../../features/home/home.dart';
import '../../../features/home/src/domain/usecases/get_apps.dart';

final getIt = GetIt.instance;

void registerDependencies() {
  // Bloc
  getIt.registerFactory(() => HomeBloc(getApps: getIt()));

  // Use cases
  getIt.registerLazySingleton(() => GetApps(getIt()));

  // Repository
  getIt.registerLazySingleton<AppRepository>(
      () => AppRepositoryImpl(localDataSource: getIt()));

  // Data sources
  getIt.registerLazySingleton<AppsLocalDataSource>(
      () => AppIconLocalDataSourceImpl());
}
