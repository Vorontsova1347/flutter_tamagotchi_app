// ignore_for_file: avoid_redundant_argument_values

import 'package:flutter/material.dart';
import 'package:mwwm/mwwm.dart';
import 'package:surf_injector/surf_injector.dart';
import 'package:tamagochi_app/assets/themes/app_themes.dart';
import 'package:tamagochi_app/config/debug_options.dart';
import 'package:tamagochi_app/features/app/app_widget_model.dart';
import 'package:tamagochi_app/features/app/di/app_component.dart';
import 'package:tamagochi_app/features/navigation/app_router.dart';

/// [Widget] of app
class App extends CoreMwwmWidget<AppWidgetModel> {
  const App({Key? key})
      : super(
          key: key,
          widgetModelBuilder: createAppWidgetModel,
        );

  @override
  WidgetState<App, AppWidgetModel> createWidgetState() => _AppState();
}

/// [WidgetState] of [App]
class _AppState extends WidgetState<App, AppWidgetModel> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: defaultTheme,
      navigatorKey: Injector.of<AppComponent>(context).component.navigator,
      showPerformanceOverlay: DebugOptions.showPerformanceOverlay,
      debugShowMaterialGrid: DebugOptions.debugShowMaterialGrid,
      checkerboardRasterCacheImages: DebugOptions.checkerboardRasterCacheImages,
      checkerboardOffscreenLayers: DebugOptions.checkerboardOffscreenLayers,
      showSemanticsDebugger: DebugOptions.showSemanticsDebugger,
      debugShowCheckedModeBanner: DebugOptions.debugShowCheckedModeBanner,
      initialRoute: AppRouter.splashScreen,
      onGenerateRoute: (routeSettings) =>
          AppRouter.routes[routeSettings.name]!(routeSettings.arguments),
    );
  }
}
