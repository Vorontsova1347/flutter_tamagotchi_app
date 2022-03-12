import 'package:flutter/material.dart';
import 'package:mwwm/mwwm.dart';
import 'package:relation/relation.dart';
import 'package:surf_injector/surf_injector.dart';
import 'package:tamagochi_app/assets/themes/app_typography.dart';
import 'package:tamagochi_app/config/screen_util_options.dart';
import 'package:tamagochi_app/features/app/di/app_component.dart';
import 'package:tamagochi_app/features/common/domain/entities/tamagochi.dart';
import 'package:tamagochi_app/features/common/domain/interactors/tamagochi/tamagochi_interactor.dart';
import 'package:tamagochi_app/features/common/domain/interactors/user/user_interactor.dart';
import 'package:tamagochi_app/features/common/screens/main/main_screen.dart';

/// [WidgetModelBuilder] of [MainScreenWidgetModel] for [MainScreen]
MainScreenWidgetModel createMainScreenWidgetModel(BuildContext context) {
  return MainScreenWidgetModel(
    navigator:
        Injector.of<AppComponent>(context).component.navigator.currentState!,
    tamagochiInteractor:
        Injector.of<AppComponent>(context).component.tamagochiInteractor,
    userInteractor: Injector.of<AppComponent>(context).component.userInteractor,
  );
}

class MainScreenWidgetModel extends WidgetModel {
  final NavigatorState navigator;
  final textFormFieldTextStyle = AppTypography.normalBoldViolinBrown;
  final TamagochiInteractor tamagochiInteractor;
  final UserInteractor userInteractor;

  MainScreenWidgetModel({
    required this.tamagochiInteractor,
    required this.userInteractor,
    required this.navigator,
  }) : super(const WidgetModelDependencies());

  Future<void> onCrossTap() async {
    final user = await userInteractor.getUser();
    debugPrint(user.toString());
  }
}
