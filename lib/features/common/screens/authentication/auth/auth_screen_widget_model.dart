import 'package:flutter/material.dart';
import 'package:mwwm/mwwm.dart';
import 'package:surf_injector/surf_injector.dart';
import 'package:tamagochi_app/assets/colors/app_colors.dart';
import 'package:tamagochi_app/assets/res/app_icons.dart';
import 'package:tamagochi_app/assets/strings/app_strings.dart';
import 'package:tamagochi_app/assets/themes/app_typography.dart';
import 'package:tamagochi_app/config/screen_util_options.dart';
import 'package:tamagochi_app/features/app/di/app_component.dart';
import 'package:tamagochi_app/features/navigation/app_router.dart';
import 'auth_screen.dart';

/// [WidgetModelBuilder] of [AuthScreenWidgetModel] for [AuthScreen]
AuthScreenWidgetModel createAuthScreenWidgetModel(BuildContext context) {
  return AuthScreenWidgetModel(
    navigator:
        Injector.of<AppComponent>(context).component.navigator.currentState!,
  );
}

/// [WidgetModel] for [AuthScreen]
class AuthScreenWidgetModel extends WidgetModel {
  final NavigatorState navigator;
  final double designWidth = ScreenUtilOptions.defaultDesignWidth;
  final double designHeight = ScreenUtilOptions.defaultDesignHeight;
  final bool minTextAdapt = ScreenUtilOptions.defaultMinTextAdapt;

  final logoPath = AppIcons.profilePictureNone;
  final backgroundColor = AppColors.deepLemon;

  final buttonTextStyle = AppTypography.normalBoldWhite;
  final underButtonTextStyle = AppTypography.normalBoldBlack;
  final buttonColor = AppColors.black;

  final buttonText = AppStrings.authScreenButtonText.toUpperCase();
  final underButtonText = AppStrings.authScreenUnderButtonText.toUpperCase();

  AuthScreenWidgetModel({
    required this.navigator,
  }) : super(const WidgetModelDependencies());

  void buttonOnTap() {
    navigator.pushNamed(AppRouter.loginScreen);
  }

  void underButtonOnTap() {}
}
