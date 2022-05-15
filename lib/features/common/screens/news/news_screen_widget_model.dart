import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mwwm/mwwm.dart';
import 'package:share_plus/share_plus.dart';
import 'package:surf_injector/surf_injector.dart';
import 'package:tamagochi_app/features/app/di/app_component.dart';
import 'package:tamagochi_app/features/common/screens/news/news_screen.dart';
import 'package:tamagochi_app/features/navigation/app_router.dart';

/// Фабрика для создания [WidgetModel] для [NewsScreen]
NewsScreenWidgetModel createMainScreenWidgetModel(BuildContext context) {
  return NewsScreenWidgetModel(
    navigator:
        Injector.of<AppComponent>(context).component.navigator.currentState!,
    buildContext: context,
  );
}

/// [WidgetModel] для [NewsScreen]
class NewsScreenWidgetModel extends WidgetModel {
  final NavigatorState navigator;
  final BuildContext buildContext;

  NewsScreenWidgetModel({
    required this.buildContext,
    required this.navigator,
  }) : super(const WidgetModelDependencies());

  @override
  void onLoad() {
    super.onLoad();
  }

  Future<void> onBackTap() async {
    await navigator.pushReplacementNamed(AppRouter.mainScreen);
  }

  Future<void> onShareTap(String url) async {
    await Share.share(url);
  }
}
