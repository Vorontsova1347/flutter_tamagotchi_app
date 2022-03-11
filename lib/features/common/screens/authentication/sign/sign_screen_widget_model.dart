import 'package:flutter/material.dart';
import 'package:mwwm/mwwm.dart';
import 'package:surf_injector/surf_injector.dart';
import 'package:tamagochi_app/features/app/di/app_component.dart';
import 'package:tamagochi_app/features/common/screens/authentication/sign/sign_screen.dart';

/// [WidgetModelBuilder] of [SignScreenWidgetModel] for [SignScreen]
SignScreenWidgetModel createSignScreenWidgetModel(BuildContext context) {
  return SignScreenWidgetModel(
    navigator:
        Injector.of<AppComponent>(context).component.navigator.currentState!,
  );
}

/// [WidgetModel] for [SignScreen]
class SignScreenWidgetModel extends WidgetModel {
  final loginTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  final NavigatorState navigator;

  SignScreenWidgetModel({
    required this.navigator,
  }) : super(const WidgetModelDependencies());

  @override
  void dispose() {
    super.dispose();

    loginTextController.dispose();
    passwordTextController.dispose();
  }

  void onArrowBackTap() {
    navigator.pop();
  }

  Future<bool> signUp(String login, String password) async {
    /// login
    /// navigator.push...
    debugPrint('$login : $password');

    return true;
  }
}
