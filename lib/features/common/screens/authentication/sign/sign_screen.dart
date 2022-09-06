import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mwwm/mwwm.dart';
import 'package:tamagochi_app/assets/colors/app_colors.dart';
import 'package:tamagochi_app/assets/res/app_icons.dart';
import 'package:tamagochi_app/assets/strings/app_strings.dart';
import 'package:tamagochi_app/config/screen_util_options.dart';
import 'package:tamagochi_app/features/common/screens/authentication/sign/sign_screen_widget_model.dart';
import 'package:tamagochi_app/features/common/screens/authentication/widgets/auth_body_widget.dart';

/// [Widget] для splash screen
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

/// [WidgetState] для [SignScreen]
class _SignScreenState extends WidgetState<SignScreen, SignScreenWidgetModel> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: ScreenUtilOptions.designSize,
      minTextAdapt: ScreenUtilOptions.defaultMinTextAdapt,
      builder: () {
        final appBarHeight = 50.0.h;
        final arrowBackPadding = 12.0.r;
        final bottom = MediaQuery.of(context).viewInsets.bottom;

        return SafeArea(
          child: Scaffold(
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
            body: Padding(
              padding: EdgeInsets.only(bottom: bottom),
              child: AuthBodyWidget(
                isLoginScreen: false,
                navigator: wm.navigator,
                loginTextController: wm.loginTextController,
                passwordTextController: wm.passwordTextController,
                buttonText: AppStrings.signInScreenButtonText.toUpperCase(),
                buttonFunction: wm.signUp,
              ),
            ),
          ),
        );
      },
    );
  }
}
