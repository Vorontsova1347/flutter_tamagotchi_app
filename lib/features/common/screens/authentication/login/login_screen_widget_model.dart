import 'package:flutter/material.dart';
import 'package:mwwm/mwwm.dart';
import 'package:surf_injector/surf_injector.dart';
import 'package:tamagochi_app/assets/colors/app_colors.dart';
import 'package:tamagochi_app/assets/res/app_icons.dart';
import 'package:tamagochi_app/assets/strings/app_strings.dart';
import 'package:tamagochi_app/assets/themes/app_typography.dart';
import 'package:tamagochi_app/config/screen_util_options.dart';
import 'package:tamagochi_app/features/app/di/app_component.dart';
import 'package:tamagochi_app/features/common/screens/authentication/login/login_screen.dart';

/// [WidgetModelBuilder] of [LoginScreenWidgetModel] for [LoginScreen]
LoginScreenWidgetModel createLoginScreenWidgetModel(BuildContext context) {
  return LoginScreenWidgetModel(
    navigator:
        Injector.of<AppComponent>(context).component.navigator.currentState!,
  );
}

/// [WidgetModel] for [LoginScreen]
class LoginScreenWidgetModel extends WidgetModel {
  final NavigatorState navigator;
  final double designWidth = ScreenUtilOptions.defaultDesignWidth;
  final double designHeight = ScreenUtilOptions.defaultDesignHeight;
  final bool minTextAdapt = ScreenUtilOptions.defaultMinTextAdapt;
  final loginTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final loginTextLengthLimit = 24;
  final passwordTextLengthLimit = 32;

  final logoPath = AppIcons.profilePictureNone;
  final arrowBack = AppIcons.arrowBack;
  final backgroundColor = AppColors.deepLemon;
  final buttonTextStyle = AppTypography.normalBoldWhite;
  final underButtonTextStyle = AppTypography.normalBoldBlack;
  final textFormFieldTextStyle = AppTypography.normalBoldViolinBrown;
  final buttonColor = AppColors.black;
  final loginHintText = 'LOGIN';
  final passwordHintText = 'PASSWORD';

  final buttonText = AppStrings.authScreenButtonText.toUpperCase();
  final underButtonText = AppStrings.authScreenUnderButtonText.toUpperCase();

  LoginScreenWidgetModel({
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
  void onLoginTap() {
    /// login
    /// navigator.push...
  }
}
