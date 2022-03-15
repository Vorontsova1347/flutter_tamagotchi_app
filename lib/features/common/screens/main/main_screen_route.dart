import 'package:flutter/material.dart';
import 'package:tamagochi_app/features/common/screens/main/main_screen.dart';

/// [MaterialPageRoute] для [MainScreen].
class MainScreenRoute extends MaterialPageRoute<void> {
  MainScreenRoute() : super(builder: (ctx) => const MainScreen());
}
