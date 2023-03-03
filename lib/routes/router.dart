import 'package:app_base/routes/page_route_transition.dart';
import 'package:app_base/screens/home/home_screen.dart';
import 'package:app_base/screens/screen1/screen1.dart';
import 'package:app_base/screens/screen2/screen2.dart';
import 'package:app_base/screens/screen3/screen3.dart';
import 'package:app_base/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'routes.dart' as routes;

class AppRouter {
  late Widget rootScreen;

  Route? onGenerateRoute(RouteSettings settings) {
    rootScreen = const SplashScreen();

    switch (settings.name) {
      case routes.rootRoute:
        return MaterialPageRoute(builder: (_) => rootScreen);
      case routes.homeRoute:
        return PageRouteTransition(
          direction: AxisDirection.left,
          child: const HomeScreen(),
        );
      case routes.screen1Route:
        final args = settings.arguments as String;
        return PageRouteTransition(
          direction: AxisDirection.left,
          child: Screen1(title: args),
        );
      case routes.screen2Route:
        final args = settings.arguments as String;
        return PageRouteTransition(
          direction: AxisDirection.left,
          child: Screen2(title: args),
        );
      case routes.screen3Route:
        final args = settings.arguments as String;
        return PageRouteTransition(
          direction: AxisDirection.left,
          child: Screen3(title: args),
        );
      default:
        return null;
    }
  }
}
