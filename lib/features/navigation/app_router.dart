import 'package:flutter/material.dart';
import 'package:tamagochi_app/features/common/screens/splash/splash_screen_route.dart';

class AppRouter {
  static const String loginScreen = '/login';
  static const String onboardingScreen = '/onboarding';
  static const String splashScreen = '/';

  static final Map<String, Route Function(Object?)> routes = {
    // TODO(svetlana): add login screen route
    //loginScreen: (_) => LoginScreenRoute(),

    // TODO(svetlana): add onboarding screen route
    //onboardingScreen: (_) => OnboardingScreenRoute(),

    splashScreen: (_) => SplashScreenRoute(),
  };
}
