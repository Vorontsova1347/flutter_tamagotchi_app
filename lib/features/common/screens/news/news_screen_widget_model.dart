import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mwwm/mwwm.dart';
import 'package:relation/relation.dart';
import 'package:surf_injector/surf_injector.dart';
import 'package:tamagochi_app/features/app/di/app_component.dart';
import 'package:tamagochi_app/features/common/domain/entities/tamagochi.dart';
import 'package:tamagochi_app/features/common/domain/interactors/image_data/image_data_interactor.dart';
import 'package:tamagochi_app/features/common/domain/interactors/tamagochi/tamagochi_interactor.dart';
import 'package:tamagochi_app/features/common/domain/interactors/user/user_interactor.dart';
import 'package:tamagochi_app/features/common/screens/main/main_screen.dart';
import 'package:tamagochi_app/features/common/screens/main/widgets/news_dialog.dart';
import 'package:tamagochi_app/features/navigation/app_router.dart';

import '../../domain/entities/image_data.dart';

/// Фабрика для создания [WidgetModel] для [MainScreen]
NewsScreenWidgetModel createNewsScreenWidgetModel(BuildContext context, ImageData data) {
  return NewsScreenWidgetModel(
    navigator:
    Injector.of<AppComponent>(context).component.navigator.currentState!,
    imageDataInteractor:
    Injector.of<AppComponent>(context).component.imageDataInteractor,
    buildContext: context,
    data: data,
  );
}

/// [WidgetModel] для [MainScreen]
class NewsScreenWidgetModel extends WidgetModel {
  final NavigatorState navigator;
  final ImageDataInteractor imageDataInteractor;
  final BuildContext buildContext;
  final ImageData data;

  final tamagochiState = StreamedState<Tamagochi?>(null);

  NewsScreenWidgetModel({
    required this.buildContext,
    required this.imageDataInteractor,
    required this.navigator,
    required this.data,
  }) : super(const WidgetModelDependencies());

  @override
  void onLoad() {
    super.onLoad();
  }
}
