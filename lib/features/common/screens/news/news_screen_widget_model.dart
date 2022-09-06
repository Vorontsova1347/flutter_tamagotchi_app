import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mwwm/mwwm.dart';
import 'package:relation/relation.dart';
import 'package:surf_injector/surf_injector.dart';
import 'package:tamagochi_app/features/app/di/app_component.dart';
import 'package:tamagochi_app/features/app/di/firebase_remote_config_component.dart';
import 'package:tamagochi_app/features/common/domain/interactors/image_data/image_data_interactor.dart';
import 'package:tamagochi_app/features/common/screens/main/main_screen.dart';

import '../../domain/entities/image_data.dart';

/// Фабрика для создания [WidgetModel] для [MainScreen]
NewsScreenWidgetModel createNewsScreenWidgetModel(
    BuildContext context, int id,) {
  return NewsScreenWidgetModel(
    firebaseBackgroundColor: Injector.of<FirebaseRemoteConfigComponent>(context)
        .component
        .config
        .getString('color'),
    navigator:
        Injector.of<AppComponent>(context).component.navigator.currentState!,
    imageDataInteractor:
        Injector.of<AppComponent>(context).component.imageDataInteractor,
    buildContext: context,
    id: id,
  );
}

/// [WidgetModel] для [MainScreen]
class NewsScreenWidgetModel extends WidgetModel {
  final String firebaseBackgroundColor;
  final NavigatorState navigator;
  final ImageDataInteractor imageDataInteractor;
  final BuildContext buildContext;
  final int id;

  final data = StreamedState<ImageData?>(null);

  String get generateLinkOnNews => imageDataInteractor.generateLinkOnNews(id);

  NewsScreenWidgetModel({
    required this.firebaseBackgroundColor,
    required this.buildContext,
    required this.imageDataInteractor,
    required this.navigator,
    required this.id,
  }) : super(const WidgetModelDependencies());

  @override
  Future<void> onLoad() async {
    final imageData = await imageDataInteractor.getImageById(id);
    await data.accept(imageData);
    super.onLoad();
  }
}
