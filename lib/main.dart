import 'dart:io';

import 'package:app_base/bloc/common_bloc/common_bloc.dart';
import 'package:app_base/bloc/observer.dart';
import 'package:app_base/bloc/post_bloc/post_bloc.dart';
import 'package:app_base/data/di/config.dart';
import 'package:app_base/data/source/local_storage/local_storage.dart';
import 'package:app_base/data/source/network/http_overrides.dart';
import 'package:app_base/routes/router.dart';
import 'package:app_base/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

void main() async {
  HttpOverrides.global = AppHttpOverrides();
  Bloc.observer = AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  initSingletons();
  await getIt<LocalStorage>().initSharedPreferences();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    getIt<CommonBloc>().add(ThemeLoaded());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<CommonBloc>()),
        BlocProvider(create: (_) => getIt<PostBloc>()),
      ],
      child: BlocBuilder<CommonBloc, CommonState>(
        builder: (context, state) {
          return Sizer(builder: (context, orientation, deviceType) {
            return MaterialApp(
              theme: state.isLightTheme ? Themes.lightTheme : Themes.darkTheme,
              debugShowCheckedModeBanner: false,
              onGenerateRoute: getIt<AppRouter>().onGenerateRoute,
            );
          });
        },
      ),
    );
  }
}
