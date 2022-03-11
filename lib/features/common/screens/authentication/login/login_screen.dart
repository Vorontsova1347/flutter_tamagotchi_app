import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mwwm/mwwm.dart';
import 'package:tamagochi_app/assets/colors/app_colors.dart';
import 'package:tamagochi_app/assets/res/app_icons.dart';
import 'package:tamagochi_app/assets/strings/app_strings.dart';
import 'package:tamagochi_app/config/screen_util_options.dart';
import 'package:tamagochi_app/features/common/screens/authentication/login/login_screen_widget_model.dart';
import 'package:tamagochi_app/features/common/screens/authentication/widgets/auth_body_widget.dart';

/// [Widget] of splash screen
class LoginScreen extends CoreMwwmWidget<LoginScreenWidgetModel> {
  const LoginScreen({
    Key? key,
  }) : super(
          key: key,
          widgetModelBuilder: createLoginScreenWidgetModel,
        );

  @override
  WidgetState<LoginScreen, LoginScreenWidgetModel> createWidgetState() =>
      _LoginScreenState();
}

/// [WidgetState] of [LoginScreen]
class _LoginScreenState
    extends WidgetState<LoginScreen, LoginScreenWidgetModel> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: ScreenUtilOptions.designSize,
      minTextAdapt: ScreenUtilOptions.defaultMinTextAdapt,
      builder: () {
        final appBarHeight = 50.0.h;
        final arrowBackPadding = 12.0.r;

        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            toolbarHeight: appBarHeight,
            backgroundColor: AppColors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
            leading: GestureDetector(
              onTap: wm.onArrowBackTap,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: arrowBackPadding),
                child: SvgPicture.asset(
                  AppIcons.arrowBack,
                ),
              ),
            ),
          ),
          backgroundColor: AppColors.deepLemon,
          body: AuthBodyWidget(
            isLoginScreen: true,
            navigator: wm.navigator,
            loginTextController: wm.loginTextController,
            passwordTextController: wm.passwordTextController,
            buttonText: AppStrings.loginScreenButtonText.toUpperCase(),
            buttonFunction: wm.loginUp,
          ),
        );
      },
    );
  }
}
