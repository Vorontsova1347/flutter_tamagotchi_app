import 'package:flutter/material.dart';
import 'package:tamagochi_app/features/common/screens/splash/splash_screen.dart';

/// [MaterialPageRoute] для [SplashScreen].
class SplashScreenRoute extends MaterialPageRoute<void> {
  SplashScreenRoute() : super(builder: (ctx) => const SplashScreen());
}
