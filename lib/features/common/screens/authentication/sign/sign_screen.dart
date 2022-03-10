import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mwwm/mwwm.dart';
import 'package:tamagochi_app/assets/colors/app_colors.dart';
import 'package:tamagochi_app/features/common/screens/authentication/sign/sign_screen_widget_model.dart';
import 'package:tamagochi_app/features/common/screens/authentication/widgets/auth_body_widget.dart';

/// [Widget] of splash screen
class SignScreen extends CoreMwwmWidget<SignScreenWidgetModel> {
  const SignScreen({
    Key? key,
  }) : super(
          key: key,
          widgetModelBuilder: createSignScreenWidgetModel,
        );

  @override
  WidgetState<SignScreen, SignScreenWidgetModel> createWidgetState() =>
      _SignScreenState();
}

/// [WidgetState] of [SignScreen]
class _SignScreenState extends WidgetState<SignScreen, SignScreenWidgetModel> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(wm.designWidth, wm.designHeight),
      minTextAdapt: wm.minTextAdapt,
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
                  wm.arrowBack,
                ),
              ),
            ),
          ),
          backgroundColor: wm.backgroundColor,
          body: AuthBodyWidget(
            navigator: wm.navigator,
            loginTextController: wm.loginTextController,
            passwordTextController: wm.passwordTextController,
            buttonText: wm.buttonText,
            buttonFunction: wm.signUp,
          ),
        );
      },
    );
  }
}
