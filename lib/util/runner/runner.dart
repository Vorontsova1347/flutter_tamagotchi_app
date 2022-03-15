// ignore_for_file: avoid_redundant_argument_values

import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:surf_injector/surf_injector.dart';
import 'package:tamagochi_app/features/app/app.dart';
import 'package:tamagochi_app/features/app/di/app_component.dart';

/// Корневая функция запуска приложения
Future<void> runApplication() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await _init();
  FlutterNativeSplash.remove();

  runApp(
    Injector(
      component: AppComponent(),
      builder: (ctx) => const App(),
    ),
  );
}

/// Здесь происходит вся инициализация ан этапе запуска приложения
Future<void> _init() async {
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}
