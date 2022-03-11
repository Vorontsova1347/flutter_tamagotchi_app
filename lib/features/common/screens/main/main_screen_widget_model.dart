import 'package:flutter/material.dart';
import 'package:mwwm/mwwm.dart';
import 'package:surf_injector/surf_injector.dart';
import 'package:tamagochi_app/assets/themes/app_typography.dart';
import 'package:tamagochi_app/config/screen_util_options.dart';
import 'package:tamagochi_app/features/app/di/app_component.dart';
import 'package:tamagochi_app/features/common/screens/main/main_screen.dart';


/// [WidgetModelBuilder] of [MainScreenWidgetModel] for [MainScreen]
MainScreenWidgetModel createMainScreenWidgetModel(BuildContext context) {
  return MainScreenWidgetModel(
    navigator:
        Injector.of<AppComponent>(context).component.navigator.currentState!,
  );
}

class MainScreenWidgetModel extends WidgetModel {
  final NavigatorState navigator;
  final double designWidth = ScreenUtilOptions.defaultDesignWidth;
  final double designHeight = ScreenUtilOptions.defaultDesignHeight;
  final bool minTextAdapt = ScreenUtilOptions.defaultMinTextAdapt;
  final textFormFieldTextStyle = AppTypography.normalBoldViolinBrown;

  MainScreenWidgetModel({
    required this.navigator,
  }) : super(const WidgetModelDependencies());

  void onCrossTap() {
    ///TODO: exit
  }
}
