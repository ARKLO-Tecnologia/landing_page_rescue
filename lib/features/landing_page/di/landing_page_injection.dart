import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rescue_pitchtech/features/landing_page/data/datasources/landing_page_local_datasource.dart';
import 'package:rescue_pitchtech/features/landing_page/data/datasources/landing_page_remote_datasource.dart';
import 'package:rescue_pitchtech/features/landing_page/data/repositories/landing_page_repository_impl.dart';
import 'package:rescue_pitchtech/features/landing_page/domain/repositories/landing_page_repository.dart';
import 'package:rescue_pitchtech/features/landing_page/presentation/viewmodels/landing_page_view_model.dart';

void initLandingPageModule(GetIt getIt) {
  getIt.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 12),
        receiveTimeout: const Duration(seconds: 12),
        headers: {'Content-Type': 'application/json'},
      ),
    ),
  );

  getIt.registerLazySingleton<LandingPageLocalDataSource>(
    () => const LandingPageLocalDataSourceImpl(),
  );

  getIt.registerLazySingleton<LandingPageRemoteDataSource>(
    () => LandingPageRemoteDataSourceImpl(getIt<Dio>()),
  );

  getIt.registerLazySingleton<LandingPageRepository>(
    () => LandingPageRepositoryImpl(
      localDataSource: getIt<LandingPageLocalDataSource>(),
      remoteDataSource: getIt<LandingPageRemoteDataSource>(),
    ),
  );

  getIt.registerFactory(
    () => LandingPageViewModel(getIt<LandingPageRepository>()),
  );
}
