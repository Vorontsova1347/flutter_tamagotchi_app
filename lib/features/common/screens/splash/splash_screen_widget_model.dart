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
import 'splash_screen.dart';

/// [WidgetModelBuilder] of [SplashScreenWidgetModel] for [SplashScreen]
SplashScreenWidgetModel createSplashScreenWidgetModel(BuildContext context) {
  return SplashScreenWidgetModel(
    navigator:
        Injector.of<AppComponent>(context).component.navigator.currentState!,
    scaffoldKey: Injector.of<AppComponent>(context).component.scaffoldKey,
  );
}

/// [WidgetModel] for [SplashScreen]
class SplashScreenWidgetModel extends WidgetModel
    with TickerProviderWidgetModelMixin {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final NavigatorState navigator;
  late final AnimationController fadeController;
  final double designWidth = ScreenUtilOptions.defaultDesignWidth;
  final double designHeight = ScreenUtilOptions.defaultDesignHeight;
  final bool minTextAdapt = ScreenUtilOptions.defaultMinTextAdapt;

  final backgroundColor = AppColors.deepLemon;

  final titleTopText = AppStrings.splashScreenTitleTopText.toUpperCase();
  final titleBottomText = AppStrings.splashScreenTitleBottomText.toUpperCase();
  final titleStyle = AppTypography.uberBoldBlack;
  final logoPath = AppIcons.splashLogo;

  final _fadeDuration = 2000;
  final _splashScreenDuration = 1500;

  SplashScreenWidgetModel({
    required this.navigator,
    required this.scaffoldKey,
  }) : super(const WidgetModelDependencies());

  @override
  void onLoad() {
    super.onLoad();

    fadeController = AnimationController(
      duration: Duration(milliseconds: _fadeDuration),
      vsync: this,
    );
    _loadApp();
  }

  @override
  void dispose() {
    fadeController.dispose();
    super.dispose();
  }

  Future<void> _loadApp() async {
    await fadeController.forward();
    await _delay(_splashScreenDuration);

    _openScreen(AppRouter.authScreen);
  }

  void _openScreen(String routeName) {
    navigator.pushReplacementNamed(routeName);
  }

  Future<void> _delay(int milliseconds) async {
    return Future.delayed(Duration(milliseconds: milliseconds));
  }
}
