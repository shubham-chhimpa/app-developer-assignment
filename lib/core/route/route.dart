import 'package:appdevassignment/feature/auth/presentation/screens/LoginScreen.dart';
import 'package:appdevassignment/feature/recommend/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';


class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    if (settings.name == HomeScreen.routeName) {
      return MaterialPageRoute(
        builder: (context) {
          return  const HomeScreen();
        },
      );
    }

    if (settings.name == LoginScreen.routeName) {
      return MaterialPageRoute(
        builder: (context) {
          return const LoginScreen(message: '',);
        },
      );
    }

    assert(false, 'Need to implement ${settings.name}');
    return null;
  }
}
