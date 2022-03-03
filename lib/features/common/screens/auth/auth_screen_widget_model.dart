import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mwwm/mwwm.dart';
import 'package:surf_injector/surf_injector.dart';
import 'package:tamagochi_app/assets/colors/app_colors.dart';
import 'package:tamagochi_app/assets/res/app_icons.dart';
import 'package:tamagochi_app/assets/strings/app_strings.dart';
import 'package:tamagochi_app/assets/themes/app_typography.dart';
import 'package:tamagochi_app/features/app/di/app_component.dart';
import 'auth_screen.dart';

/// [WidgetModelBuilder] of [AuthScreenWidgetModel] for [AuthScreen]
AuthScreenWidgetModel createAuthScreenWidgetModel(BuildContext context) {
  return AuthScreenWidgetModel(
    navigator:
        Injector.of<AppComponent>(context).component.navigator.currentState!,
    scaffoldKey: Injector.of<AppComponent>(context).component.scaffoldKey,
    designHeight: Injector.of<AppComponent>(context).component.designHeight,
    designWidth: Injector.of<AppComponent>(context).component.designWidth,
    minTextAdapt: Injector.of<AppComponent>(context).component.minTextAdapt,
  );
}

/// [WidgetModel] for [AuthScreen]
class AuthScreenWidgetModel extends WidgetModel {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final NavigatorState navigator;
  final double designWidth;
  final double designHeight;
  final bool minTextAdapt;

  final logoPath = AppIcons.profilePictureNone;
  final backgroundColor = AppColors.deepLemon;

  final buttonTextStyle =
      AppTypography.normalBoldWhite;
  final underButtonTextStyle =
      AppTypography.normalBoldBlack;
  final buttonColor = AppColors.black;

  final buttonText = AppStrings.authScreenButtonText.toUpperCase();
  final underButtonText = AppStrings.authScreenUnderButtonText.toUpperCase();

  AuthScreenWidgetModel({
    required this.designWidth,
    required this.designHeight,
    required this.minTextAdapt,
    required this.navigator,
    required this.scaffoldKey,
  }) : super(const WidgetModelDependencies());

  void buttonOnTap() {}

  void underButtonOnTap() {}
}
