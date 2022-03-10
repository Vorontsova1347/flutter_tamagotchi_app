import 'package:flutter/material.dart';
import 'package:tamagochi_app/features/common/screens/authentication/auth/auth_screen_route.dart';
import 'package:tamagochi_app/features/common/screens/authentication/create/create_screen_route.dart';
import 'package:tamagochi_app/features/common/screens/authentication/login/login_screen_route.dart';
import 'package:tamagochi_app/features/common/screens/authentication/sign/sign_screen_route.dart';
import 'package:tamagochi_app/features/common/screens/splash/splash_screen_route.dart';

class AppRouter {
  static const String authScreen = '/auth';
  static const String loginScreen = '$authScreen/login';
  static const String signInScreen = '$authScreen/signin';
  static const String createScreen = '$signInScreen/create';
  static const String splashScreen = '/';

  static final Map<String, Route Function(Object?)> routes = {
    splashScreen: (_) => SplashScreenRoute(),
    authScreen: (_) => AuthScreenRoute(),
    loginScreen: (_) => LoginScreenRoute(),
    signInScreen: (_) => SignScreenRoute(),
    createScreen: (_) => CreateScreenRoute(),
  };
}
