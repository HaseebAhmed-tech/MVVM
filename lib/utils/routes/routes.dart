import 'package:flutter/material.dart';
import 'package:mvvm_rest/view/signup_view.dart';
import 'package:mvvm_rest/view/splash_view.dart';

import '../../view/home_view.dart';
import '../../view/login_view.dart';
import 'routes_name.dart';

class Routes {
  static MaterialPageRoute generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.login:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case RoutesName.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case RoutesName.signup:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case RoutesName.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('Page not found'),
            ),
          );
        });
    }
  }
}
