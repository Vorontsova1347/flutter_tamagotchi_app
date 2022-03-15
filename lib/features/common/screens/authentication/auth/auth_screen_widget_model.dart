import 'package:flutter/material.dart';
import 'package:mwwm/mwwm.dart';
import 'package:surf_injector/surf_injector.dart';
import 'package:tamagochi_app/features/app/di/app_component.dart';
import 'package:tamagochi_app/features/navigation/app_router.dart';
import 'auth_screen.dart';

/// Фабрика для создания [WidgetModel] для [AuthScreen]
AuthScreenWidgetModel createAuthScreenWidgetModel(BuildContext context) {
  return AuthScreenWidgetModel(
    navigator:
        Injector.of<AppComponent>(context).component.navigator.currentState!,
  );
}

/// [WidgetModel] для [AuthScreen]
class AuthScreenWidgetModel extends WidgetModel {
  final NavigatorState navigator;

  AuthScreenWidgetModel({
    required this.navigator,
  }) : super(const WidgetModelDependencies());

  void onSignInTap() {
    navigator.pushNamed(AppRouter.signInScreen);
  }

  void onLoginTap() {
    navigator.pushNamed(AppRouter.loginScreen);
  }
}
