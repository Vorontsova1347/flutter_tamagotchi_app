import 'package:flutter/material.dart';
import 'package:tamagochi_app/features/common/screens/auth/auth_screen_route.dart';
import 'package:tamagochi_app/features/common/screens/splash/splash_screen_route.dart';

class AppRouter {
  static const String authScreen = '/auth';
  static const String onboardingScreen = '/onboarding';
  static const String splashScreen = '/';

  static final Map<String, Route Function(Object?)> routes = {
    authScreen: (_) => AuthScreenRoute(),

    // TODO(svetlana): add onboarding screen route
    //onboardingScreen: (_) => OnboardingScreenRoute(),

    splashScreen: (_) => SplashScreenRoute(),
  };
}
