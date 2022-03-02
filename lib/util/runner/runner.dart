// ignore_for_file: avoid_redundant_argument_values

import 'dart:async';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:surf_injector/surf_injector.dart';
import 'package:tamagochi_app/config/debug_options.dart';
import 'package:tamagochi_app/features/app/app.dart';
import 'package:tamagochi_app/features/app/di/app_component.dart';

Future<void> runApplication() async {
  /// Нужно вызвать для избежания потери ориентации
  WidgetsFlutterBinding.ensureInitialized();

  /// Заморозка ориентации
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  FlutterNativeSplash.removeAfter(_init);

  runApp(
    DevicePreview(
      enabled: DebugOptions.devicePreview,
      builder: (context) => Injector(
        component: AppComponent(),
        builder: (ctx) => App(),
      ),
    ),
  );
}

/// Метод для инициализации начальных ресурсов\ прогрузки
// ignore: avoid_void_async
void _init(BuildContext context) async {}
