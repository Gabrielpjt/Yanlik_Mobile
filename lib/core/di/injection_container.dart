import 'package:get_it/get_it.dart';
import '../network/api_client.dart';
import '../bloc/user_session/user_session_bloc.dart';
import '../bloc/notification/notification_bloc.dart';
import '../bloc/app_loading/app_loading_bloc.dart';
import '../../features/api_test/data/datasources/post_remote_datasource.dart';
import '../../features/api_test/data/datasources/user_remote_datasource.dart';
import '../../features/api_test/data/repositories/post_repository_impl.dart';
import '../../features/api_test/data/repositories/user_repository_impl.dart';
import '../../features/api_test/domain/repositories/post_repository.dart';
import '../../features/api_test/domain/repositories/user_repository.dart';
import '../../features/api_test/presentation/bloc/post_detail/post_detail_bloc.dart';
import '../../features/api_test/presentation/bloc/post_list/post_list_bloc.dart';
import '../../features/api_test/presentation/bloc/user_list/user_list_bloc.dart';

final getIt = GetIt.instance;

/// Initialize all dependencies.
///
/// Call this once in `main()` before `runApp()`.
///
/// Registration order:
/// 1. Core services (API client)
/// 2. Data sources
/// 3. Repositories
/// 4. Blocs
Future<void> setupDependencies() async {
  // ── Core ──
  getIt.registerLazySingleton<ApiClient>(() {
    final client = ApiClient();
    // Point to JSONPlaceholder for testing
    client.setBaseUrl('https://jsonplaceholder.typicode.com');
    return client;
  });

  // ── Data Sources ──
  getIt.registerLazySingleton<PostRemoteDatasource>(
    () => PostRemoteDatasource(getIt<ApiClient>()),
  );
  getIt.registerLazySingleton<UserRemoteDatasource>(
    () => UserRemoteDatasource(getIt<ApiClient>()),
  );

  // ── Repositories ──
  getIt.registerLazySingleton<PostRepository>(
    () => PostRepositoryImpl(getIt<PostRemoteDatasource>()),
  );
  getIt.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(getIt<UserRemoteDatasource>()),
  );

  // ── Feature Blocs (factory = new instance each time) ──
  getIt.registerFactory<PostListBloc>(
    () => PostListBloc(getIt<PostRepository>()),
  );
  getIt.registerFactory<PostDetailBloc>(
    () => PostDetailBloc(getIt<PostRepository>()),
  );
  getIt.registerFactory<UserListBloc>(
    () => UserListBloc(getIt<UserRepository>()),
  );

  // ── Global Blocs (singleton = one instance for entire app) ──
  getIt.registerLazySingleton<UserSessionBloc>(() => UserSessionBloc());
  getIt.registerLazySingleton<NotificationBloc>(() => NotificationBloc());
  getIt.registerLazySingleton<AppLoadingBloc>(() => AppLoadingBloc());
}
