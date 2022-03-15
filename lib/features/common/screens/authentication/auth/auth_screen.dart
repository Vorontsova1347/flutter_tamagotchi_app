import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mwwm/mwwm.dart';
import 'package:tamagochi_app/assets/colors/app_colors.dart';
import 'package:tamagochi_app/assets/res/app_icons.dart';
import 'package:tamagochi_app/assets/strings/app_strings.dart';
import 'package:tamagochi_app/assets/themes/app_typography.dart';
import 'package:tamagochi_app/config/screen_util_options.dart';
import 'package:tamagochi_app/features/common/screens/authentication/auth/auth_screen_widget_model.dart';

/// [Widget] для splash screen
class AuthScreen extends CoreMwwmWidget<AuthScreenWidgetModel> {
  const AuthScreen({
    Key? key,
  }) : super(
          key: key,
          widgetModelBuilder: createAuthScreenWidgetModel,
        );

  @override
  WidgetState<AuthScreen, AuthScreenWidgetModel> createWidgetState() =>
      _AuthScreenState();
}

/// [WidgetState] для [AuthScreen]
class _AuthScreenState extends WidgetState<AuthScreen, AuthScreenWidgetModel> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: ScreenUtilOptions.designSize,
      minTextAdapt: ScreenUtilOptions.defaultMinTextAdapt,
      builder: () {
        final logoHeight = 160.0.r;
        final logoWidth = 160.0.r;

        final buttonRadius = 10.0.r;
        final buttonHeight = 42.0.h;
        final buttonWidth = 184.0.w;

        final sizedBoxTopHeight = 42.h;
        final sizedBoxBottomHeight = 18.h;

        return SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.deepLemon,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppIcons.profilePictureNone,
                    height: logoHeight,
                    width: logoWidth,
                  ),
                  SizedBox(
                    height: sizedBoxTopHeight,
                  ),
                  GestureDetector(
                    onTap: wm.onLoginTap,
                    child: Container(
                      height: buttonHeight,
                      width: buttonWidth,
                      decoration: BoxDecoration(
                        color: AppColors.black,
                        borderRadius: BorderRadius.circular(buttonRadius),
                      ),
                      child: Center(
                        child: Text(
                          AppStrings.loginScreenButtonText.toUpperCase(),
                          style: AppTypography.normalBoldWhite,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: sizedBoxBottomHeight,
                  ),
                  GestureDetector(
                    onTap: wm.onSignInTap,
                    child: Center(
                      child: Text(
                        AppStrings.signInScreenButtonText.toUpperCase(),
                        style: AppTypography.normalBoldBlack,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
