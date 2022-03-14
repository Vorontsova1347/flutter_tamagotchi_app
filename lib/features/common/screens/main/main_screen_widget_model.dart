import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mwwm/mwwm.dart';
import 'package:relation/relation.dart';
import 'package:surf_injector/surf_injector.dart';
import 'package:tamagochi_app/assets/themes/app_typography.dart';
import 'package:tamagochi_app/features/app/di/app_component.dart';
import 'package:tamagochi_app/features/common/domain/entities/access_data.dart';
import 'package:tamagochi_app/features/common/domain/entities/tamagochi.dart';
import 'package:tamagochi_app/features/common/domain/interactors/tamagochi/tamagochi_interactor.dart';
import 'package:tamagochi_app/features/common/domain/interactors/user/user_interactor.dart';
import 'package:tamagochi_app/features/common/screens/main/main_screen.dart';
import 'package:tamagochi_app/features/navigation/app_router.dart';

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

  final tamagochiState = StreamedState<Tamagochi?>(null);
  bool isBoy = true;
  String name = '';

  MainScreenWidgetModel({
    required this.tamagochiInteractor,
    required this.userInteractor,
    required this.navigator,
  }) : super(const WidgetModelDependencies());

  @override
  void onLoad() {
    _updateTamagchi();

    _setUpTimedTamagochiUpdate();
    super.onLoad();
  }

  Future<void> onFoodTap() async {
    await tamagochiInteractor.food();
    await _updateTamagchi();
  }

  Future<void> onGameTap() async {
    await tamagochiInteractor.game();
    await _updateTamagchi();
  }

  Future<void> onSleepTap() async {
    await tamagochiInteractor.sleep();
    await _updateTamagchi();
  }

  Future<void> onHealthTap() async {
    await tamagochiInteractor.health();
    await _updateTamagchi();
  }

  Future<void> onCrossTap() async {
    userInteractor.logout();
    await navigator.pushReplacementNamed(AppRouter.authScreen);
  }

  Future<void> _updateTamagchi() async {
    final tamagochiResponse = (await userInteractor.getData()).tamagochi;
    isBoy = tamagochiResponse.gender == 'Boy';
    name = tamagochiResponse.name;

    await tamagochiState.accept(tamagochiResponse);
  }

  void _setUpTimedTamagochiUpdate() {
    Timer.periodic(const Duration(milliseconds: 5000), (timer) {
      _updateTamagchi();
      debugPrint('tamagochi updated');
    });
  }
}
