import 'package:aurora_movies/features/movies/data/repository_impl/movies_repository_impl.dart';
import 'package:aurora_movies/features/movies/domain/repository/movies_repository.dart';
import 'package:aurora_movies/features/movies/presentation/bloc/movies_bloc.dart';
import 'package:aurora_movies/utils/api_manager/api_manager.dart';
import 'package:aurora_movies/utils/navigation/route_generator.dart';
import 'package:aurora_movies/utils/shared_preferences_manager/shared_preferences_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

extension GetItRegistration on GetIt {
  void registerDependencies() {
    final getIt = GetIt.instance;

    getIt.registerLazySingleton<GoRouter>(
      () => RouteGenerator.router,
    );

    getIt.registerLazySingleton<SharedPreferencesManager>(
      () => SharedPreferencesManager(),
    );

    getIt.registerSingletonAsync<ApiManager>(
      () async {
        final sharedPreferencesManager = getIt<SharedPreferencesManager>();
        final apiManager = ApiManager(sharedPreferencesManager: sharedPreferencesManager);
        await apiManager.initializeAuthToken();
        await apiManager.fetchConfiguration();
        return apiManager;
      },
    );

    getIt.registerLazySingleton<MoviesRepository>(
      () => MoviesRepositoryImpl(getIt<ApiManager>()),
    );

    getIt.registerLazySingleton<MoviesBloc>(
      () => MoviesBloc(
        moviesRepository: getIt<MoviesRepository>(),
      ),
    );
  }
}
