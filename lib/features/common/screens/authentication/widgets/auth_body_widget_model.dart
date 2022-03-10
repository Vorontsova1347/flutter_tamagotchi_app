import 'package:flutter/material.dart';
import 'package:mwwm/mwwm.dart';
import 'package:tamagochi_app/assets/colors/app_colors.dart';
import 'package:tamagochi_app/assets/res/app_icons.dart';
import 'package:tamagochi_app/assets/strings/app_strings.dart';
import 'package:tamagochi_app/assets/themes/app_typography.dart';
import 'package:tamagochi_app/features/common/screens/authentication/widgets/auth_body_widget.dart';
import 'package:tamagochi_app/features/navigation/app_router.dart';

/// [WidgetModelBuilder] of [AuthBodyWidgetModel] for [AuthBodyWidget]
// ignore: long-parameter-list
AuthBodyWidgetModel createAuthBodyWidgetModel({
  required String buttonText,
  required TextEditingController loginTextController,
  required TextEditingController passwordTextController,
  required Future<bool> Function(String login, String password) buttonFunction,
  required NavigatorState navigator,
  required bool isLoginScreen,
}) {
  return AuthBodyWidgetModel(
    isLoginScreen:isLoginScreen,
    navigator: navigator,
    loginTextController: loginTextController,
    passwordTextController: passwordTextController,
    buttonText: buttonText,
    buttonFunction: buttonFunction,
  );
}

/// [WidgetModel] for [AuthBodyWidget]
class AuthBodyWidgetModel extends WidgetModel {
  final NavigatorState navigator;
  final TextEditingController loginTextController;
  final TextEditingController passwordTextController;
  final bool isLoginScreen;
  final loginTextLengthLimit = 24;
  final passwordTextLengthLimit = 32;
  final logoPath = AppIcons.profilePictureNone;
  final arrowBack = AppIcons.arrowBack;
  final backgroundColor = AppColors.deepLemon;
  final buttonTextStyle = AppTypography.normalBoldWhite;
  final underButtonTextStyle = AppTypography.normalBoldBlack;
  final textFormFieldTextStyle = AppTypography.normalBoldViolinBrown;
  final buttonColor = AppColors.black;
  final loginHintText = AppStrings.loginHintText.toUpperCase();
  final passwordHintText = AppStrings.passwordHintText.toUpperCase();

  final String buttonText;
  final Future<bool> Function(String login, String password) buttonFunction;

  AuthBodyWidgetModel({
    required this.isLoginScreen,
    required this.navigator,
    required this.loginTextController,
    required this.passwordTextController,
    required this.buttonFunction,
    required this.buttonText,
  }) : super(const WidgetModelDependencies());

  Future<void> onButtonTap() async {
    if (isLoginScreen) {
      await _loginCycle();
    } else {
      await _signinCycle();
    }
  }

  Future<void> _loginCycle() async {
    final login = loginTextController.value.text;
    final password = passwordTextController.value.text;
    if (await buttonFunction(
      login,
      password,
    )) {}
    passwordTextController.clear();
  }

  Future<void> _signinCycle() async {
    await navigator.pushNamed(AppRouter.createScreen);
  }
}
