// ignore_for_file: avoid_redundant_argument_values

import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:surf_injector/surf_injector.dart';
import 'package:tamagochi_app/features/app/app.dart';
import 'package:tamagochi_app/features/app/di/app_component.dart';

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

/// All the dependencies and instances, used in whole app, should be initialized here
// ignore: avoid_void_async
Future<void> _init() async {
  // Orientation freeze
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}
