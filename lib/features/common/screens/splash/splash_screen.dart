import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mwwm/mwwm.dart';
import 'package:tamagochi_app/assets/colors/app_colors.dart';
import 'package:tamagochi_app/assets/res/app_icons.dart';
import 'package:tamagochi_app/assets/strings/app_strings.dart';
import 'package:tamagochi_app/assets/themes/app_typography.dart';
import 'package:tamagochi_app/config/screen_util_options.dart';
import 'package:tamagochi_app/features/common/screens/splash/splash_screen_widget_model.dart';

/// [Widget] of splash screen
class SplashScreen extends CoreMwwmWidget<SplashScreenWidgetModel> {
  const SplashScreen({
    Key? key,
  }) : super(
          key: key,
          widgetModelBuilder: createSplashScreenWidgetModel,
        );

  @override
  WidgetState<SplashScreen, SplashScreenWidgetModel> createWidgetState() =>
      _SplashScreenState();
}

/// [WidgetState] of [SplashScreen]
class _SplashScreenState
    extends WidgetState<SplashScreen, SplashScreenWidgetModel> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: ScreenUtilOptions.designSize,
      minTextAdapt: ScreenUtilOptions.defaultMinTextAdapt,
      builder: () {
        final logoWidth = 360.0.h;

        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            key: wm.scaffoldKey,
            backgroundColor: AppColors.deepLemon,
            body: Center(
              child: FadeTransition(
                opacity: wm.fadeController,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.splashScreenTitleTopText.toUpperCase(),
                      style: AppTypography.uberBoldBlack,
                    ),
                    Text(
                      AppStrings.splashScreenTitleBottomText.toUpperCase(),
                      style: AppTypography.uberBoldBlack,
                    ),
                    SvgPicture.asset(
                      AppIcons.splashLogo,
                      width: logoWidth,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
