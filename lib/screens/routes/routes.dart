import 'package:flutter/material.dart';
import 'package:smart_home/screens/auth/sign_in/sign_in_screen.dart';
import 'package:smart_home/screens/auth/sign_up/sign_up_screen.dart';
import 'package:smart_home/screens/on_boarding/on_boarding_screen.dart';
import 'package:smart_home/screens/welcome/welcome_screen.dart';

import '../splash/splash_screen.dart';

class AppRoutes {
  static Route generateRoute(
    RouteSettings settings,
  ) {
    switch (settings.name) {
      case RouteNames.splashScreen:
        return navigate(
          const SplashScreen(),
        );
      case RouteNames.signUpScreen:
        return navigate(
          const SignUpScreen(),
        );
      case RouteNames.signInScreen:
        return navigate(
          const SignInScreen(),
        );
      case RouteNames.welcomeScreen:
        return navigate(
          const WelcomeScreen(),
        );
      case RouteNames.onBoardingScreen:
        return navigate(
          const OnBoardingScreen(),
        );
      default:
        return navigate(
          const Scaffold(
            body: Center(
              child: Text("This kind of rout does not exist!"),
            ),
          ),
        );
    }
  }

  static navigate(
    Widget widget,
  ) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}

class RouteNames {
  static const String splashScreen = "/";
  static const String onBoardingScreen = "/on_boarding_route";
  static const String welcomeScreen = "/welcome_route";
  static const String signUpScreen = "/sign_up_route";
  static const String signInScreen = "/sign_in_route";
}
