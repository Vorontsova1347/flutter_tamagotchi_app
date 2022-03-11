import 'package:flutter/material.dart';
import 'package:mwwm/mwwm.dart';
import 'package:relation/relation.dart';
import 'package:surf_injector/surf_injector.dart';
import 'package:tamagochi_app/assets/colors/app_colors.dart';
import 'package:tamagochi_app/assets/res/app_icons.dart';
import 'package:tamagochi_app/assets/strings/app_strings.dart';
import 'package:tamagochi_app/assets/themes/app_typography.dart';
import 'package:tamagochi_app/config/screen_util_options.dart';
import 'package:tamagochi_app/features/app/di/app_component.dart';
import 'package:tamagochi_app/features/common/screens/authentication/create/create_screen.dart';

/// [WidgetModelBuilder] of [CreateScreenWidgetModel] for [CreateScreen]
CreateScreenWidgetModel createCreateScreenWidgetModel(BuildContext context) {
  return CreateScreenWidgetModel(
    navigator:
        Injector.of<AppComponent>(context).component.navigator.currentState!,
  );
}

class CreateScreenWidgetModel extends WidgetModel {
  final NavigatorState navigator;
  final double designWidth = ScreenUtilOptions.defaultDesignWidth;
  final double designHeight = ScreenUtilOptions.defaultDesignHeight;
  final bool minTextAdapt = ScreenUtilOptions.defaultMinTextAdapt;
  final textFormFieldTextStyle = AppTypography.normalBoldViolinBrown;
  final nameTextController = TextEditingController();
  final nameTextLengthLimit = 24;
  final nameHintText = AppStrings.nameHintText.toUpperCase();
  final logoPath = AppIcons.profilePictureNone;
  final arrowBack = AppIcons.arrowBack;
  final backgroundColor = AppColors.deepLemon;
  final buttonText = AppStrings.createScreenButtonText.toUpperCase();
  final buttonColor = AppColors.black;
  final buttonTextStyle = AppTypography.normalBoldWhite;
  final radioPickState = StreamedState<bool?>(null);
  final radioFirstText = AppStrings.createScreenRadioFirstText.toUpperCase();
  final radioSecondText = AppStrings.createScreenRadioSecondText.toUpperCase();

  CreateScreenWidgetModel({
    required this.navigator,
  }) : super(const WidgetModelDependencies());

  void onArrowBackTap() {
    navigator.pop();
  }

  Future<void> onRadioFirstTap() async {
    if (radioPickState.value == null || radioPickState.value == false) {
      await radioPickState.accept(true);
    }
  }

  Future<void> onRadioSecondTap() async {
    if (radioPickState.value == null || radioPickState.value == true) {
      await radioPickState.accept(false);
    }
  }

  Future<void> onButtonTap() async {
    if (radioPickState.value != null) {}
  }
}
