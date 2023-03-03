import 'package:app_base/bloc/common_bloc/common_bloc.dart';
import 'package:app_base/bloc/post_bloc/post_bloc.dart';
import 'package:app_base/data/source/local_storage/local_storage.dart';
import 'package:app_base/data/source/network/http_utils.dart';
import 'package:app_base/routes/router.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> initSingletons() async {
  // Initialize services
  getIt.registerLazySingleton<AppRouter>(() => AppRouter());
  getIt.registerLazySingleton<LocalStorage>(() => LocalStorage());
  getIt.registerLazySingleton<HttpUtils>(() => HttpUtils());

  // Initialize blocs
  getIt.registerLazySingleton<CommonBloc>(() => CommonBloc());
  getIt.registerLazySingleton<PostBloc>(() => PostBloc());
}
