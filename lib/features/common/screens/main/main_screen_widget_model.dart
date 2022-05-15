import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mwwm/mwwm.dart';
import 'package:relation/relation.dart';
import 'package:surf_injector/surf_injector.dart';
import 'package:tamagochi_app/features/app/di/app_component.dart';
import 'package:tamagochi_app/features/common/domain/entities/image_data.dart';
import 'package:tamagochi_app/features/common/domain/entities/tamagochi.dart';
import 'package:tamagochi_app/features/common/domain/interactors/image_data/image_data_interactor.dart';
import 'package:tamagochi_app/features/common/domain/interactors/tamagochi/tamagochi_interactor.dart';
import 'package:tamagochi_app/features/common/domain/interactors/user/user_interactor.dart';
import 'package:tamagochi_app/features/common/screens/main/main_screen.dart';
import 'package:tamagochi_app/features/common/screens/main/widgets/news_dialog.dart';
import 'package:tamagochi_app/features/navigation/app_router.dart';

/// Фабрика для создания [WidgetModel] для [MainScreen]
MainScreenWidgetModel createMainScreenWidgetModel(BuildContext context) {
  return MainScreenWidgetModel(
    navigator:
        Injector.of<AppComponent>(context).component.navigator.currentState!,
    tamagochiInteractor:
        Injector.of<AppComponent>(context).component.tamagochiInteractor,
    userInteractor: Injector.of<AppComponent>(context).component.userInteractor,
    imageDataInteractor:
        Injector.of<AppComponent>(context).component.imageDataInteractor,
    buildContext: context,
  );
}

/// [WidgetModel] для [MainScreen]
class MainScreenWidgetModel extends WidgetModel {
  final NavigatorState navigator;
  final TamagochiInteractor tamagochiInteractor;
  final UserInteractor userInteractor;
  final ImageDataInteractor imageDataInteractor;
  final BuildContext buildContext;

  final tamagochiState = StreamedState<Tamagochi?>(null);
  bool isBoy = true;
  String name = '';

  bool isFoodLoading = false;
  bool isSleepLoading = false;
  bool isHealthLoading = false;
  bool isGameLoading = false;
  bool isNewsLoading = false;

  MainScreenWidgetModel({
    required this.buildContext,
    required this.imageDataInteractor,
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
    if (!isFoodLoading) {
      isFoodLoading = true;
      await tamagochiInteractor.food();
      await _updateTamagchi();
      isFoodLoading = false;
    }
  }

  Future<void> onGameTap() async {
    if (!isGameLoading) {
      isGameLoading = true;
      await tamagochiInteractor.game();
      await _updateTamagchi();
      isGameLoading = false;
    }
  }

  Future<void> onSleepTap() async {
    if (!isSleepLoading) {
      isSleepLoading = true;
      await tamagochiInteractor.sleep();
      await _updateTamagchi();
      isSleepLoading = false;
    }
  }

  Future<void> onHealthTap() async {
    if (!isHealthLoading) {
      isHealthLoading = true;
      await tamagochiInteractor.health();
      await _updateTamagchi();
      isHealthLoading = false;
    }
  }

  Future<void> onCrossTap() async {
    userInteractor.logout();
    await navigator.pushReplacementNamed(AppRouter.authScreen);
  }

  Future<void> onNewsTap() async {
    if (!isNewsLoading) {
      isNewsLoading = true;
      await showNewsDialog(
        buildContext,
        await imageDataInteractor.getAllImages(),
        _openNewsScreen,
      );
      isNewsLoading = false;
    }
  }

  Future<void> _openNewsScreen(ImageData imageData) async {
    await navigator.pushReplacementNamed(AppRouter.newsScreen, arguments: imageData);
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
