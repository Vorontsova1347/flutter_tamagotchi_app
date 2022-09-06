// ignore_for_file: avoid_redundant_argument_values

import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:mwwm/mwwm.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:surf_injector/surf_injector.dart';
import 'package:tamagochi_app/assets/themes/app_themes.dart';
import 'package:tamagochi_app/config/debug_options.dart';
import 'package:tamagochi_app/features/app/app_widget_model.dart';
import 'package:tamagochi_app/features/app/di/app_component.dart';
import 'package:tamagochi_app/features/common/screens/news/news_screen_route.dart';
import 'package:tamagochi_app/features/navigation/app_router.dart';

import '../../config/onesignal.dart';
import 'di/firebase_remote_config_component.dart';

/// [Widget] приложения
class App extends CoreMwwmWidget<AppWidgetModel> {
  const App({Key? key})
      : super(
          key: key,
          widgetModelBuilder: createAppWidgetModel,
        );

  @override
  WidgetState<App, AppWidgetModel> createWidgetState() => _AppState();
}

/// [WidgetState] для [App]
class _AppState extends WidgetState<App, AppWidgetModel> {
  Uri? url;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirebaseRemoteConfig>(
      future: initRemoteConfig(),
      builder: (context, state) => state.data == null
          ? const Center(child: CircularProgressIndicator())
          : Injector(
              component: FirebaseRemoteConfigComponent(state.data!),
              builder: (context) {
                return MaterialApp(
                  theme: defaultTheme,
                  navigatorKey:
                      Injector.of<AppComponent>(context).component.navigator,
                  showPerformanceOverlay: DebugOptions.showPerformanceOverlay,
                  debugShowMaterialGrid: DebugOptions.debugShowMaterialGrid,
                  checkerboardRasterCacheImages:
                      DebugOptions.checkerboardRasterCacheImages,
                  checkerboardOffscreenLayers:
                      DebugOptions.checkerboardOffscreenLayers,
                  showSemanticsDebugger: DebugOptions.showSemanticsDebugger,
                  debugShowCheckedModeBanner:
                      DebugOptions.debugShowCheckedModeBanner,
                  initialRoute: AppRouter.splashScreen,
                  onGenerateRoute: (routeSettings) {
                    if (routeSettings.name != null &&
                        routeSettings.name!.contains(AppRouter.newsScreen)) {
                      final uri = Uri.parse(routeSettings.name!);
                      final newsId = int.tryParse(uri.pathSegments.last) ??
                          routeSettings.arguments as int?;

                      return newsId != null
                          ? NewsScreenRoute(newsId)
                          : AppRouter.routes[AppRouter.authScreen]!(null);
                    }

                    return AppRouter
                        .routes[routeSettings.name]!(routeSettings.arguments);
                  },
                );
              },
            ),
    );
  }

  Future<void> initPlatformState() async {
    await OneSignal.shared.setAppId(oneSignalAppId);
    await OneSignal.shared.promptUserForPushNotificationPermission();
  }

  Future<FirebaseRemoteConfig> initRemoteConfig() async {
    await Firebase.initializeApp();
    final remoteConfig = FirebaseRemoteConfig.instance;

    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(seconds: 0),
    ));

    final fetchSuccess = await remoteConfig.fetchAndActivate();

    if (fetchSuccess) {
      final settings = remoteConfig.getAll();
      log(remoteConfig.getString('color'));
      log(settings['color'].toString());
    } else {
      log('fetch unsuccessful');
    }

    return remoteConfig;
  }
}
