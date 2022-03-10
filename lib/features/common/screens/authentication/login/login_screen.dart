import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mwwm/mwwm.dart';
import 'package:tamagochi_app/assets/colors/app_colors.dart';
import 'package:tamagochi_app/features/common/screens/authentication/login/login_screen_widget_model.dart';

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
      designSize: Size(wm.designWidth, wm.designHeight),
      minTextAdapt: wm.minTextAdapt,
      builder: () {
        final logoHeight = 160.0.r;
        final logoWidth = 160.0.r;

        final buttonRadius = 10.0.r;
        final buttonHeight = 42.0.h;
        final buttonWidth = 184.0.w;

        final textfieldHeight = 42.0.h;
        final textfieldWidth = 320.0.w;

        final appBarHeight = 50.0.h;

        final arrowBackPadding = 12.0.r;

        final sizedBoxTopHeight = 42.h;
        final sizedBoxBottomHeight = 18.h;
        final betweenFieldsHeight = 24.h;

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
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  wm.logoPath,
                  height: logoHeight,
                  width: logoWidth,
                ),
                SizedBox(
                  height: sizedBoxTopHeight,
                ),
                Container(
                  height: textfieldHeight,
                  width: textfieldWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(buttonRadius),
                  ),
                  child: TextFormField(
                    style: wm.textFormFieldTextStyle,
                    controller: wm.loginTextController,
                    maxLength: wm.loginTextLengthLimit,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(wm.loginTextLengthLimit),
                      FilteringTextInputFormatter.allow(
                        RegExp('[a-z A-Z á-ú Á-Ú]'),
                      ),
                      FilteringTextInputFormatter.deny(' '),
                    ],
                    // obscureText: isPassword,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: wm.loginHintText,
                      contentPadding: EdgeInsets.only(
                        left: textfieldHeight / 3,
                        bottom: textfieldHeight / 2, // HERE THE IMPORTANT PART
                      ),
                      counterText: '',
                      focusedBorder: const OutlineInputBorder(),
                      disabledBorder: const OutlineInputBorder(),
                      enabledBorder: const OutlineInputBorder(),
                      fillColor: wm.backgroundColor,
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(
                  height: betweenFieldsHeight,
                ),
                Container(
                  height: textfieldHeight,
                  width: textfieldWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(buttonRadius),
                  ),
                  child: TextFormField(
                    style: wm.textFormFieldTextStyle,
                    controller: wm.passwordTextController,
                    maxLength: wm.passwordTextLengthLimit,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(
                        wm.passwordTextLengthLimit,
                      ),
                      FilteringTextInputFormatter.allow(
                        RegExp('[a-z A-Z á-ú Á-Ú 0-9]'),
                      ),
                      FilteringTextInputFormatter.deny(' '),
                    ],
                    // obscureText: isPassword,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: wm.passwordHintText,
                      contentPadding: EdgeInsets.only(
                        left: textfieldHeight / 3,
                        bottom: textfieldHeight / 2, // HERE THE IMPORTANT PART
                      ),
                      counterText: '',
                      focusedBorder: const OutlineInputBorder(),
                      disabledBorder: const OutlineInputBorder(),
                      enabledBorder: const OutlineInputBorder(),
                      fillColor: wm.backgroundColor,
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(
                  height: sizedBoxBottomHeight,
                ),
                GestureDetector(
                  onTap: wm.onLoginTap, 
                  child: Container(
                    height: buttonHeight,
                    width: buttonWidth,
                    decoration: BoxDecoration(
                      color: wm.buttonColor,
                      borderRadius: BorderRadius.circular(buttonRadius),
                    ),
                    child: Center(
                      child: Text(
                        wm.buttonText,
                        style: wm.buttonTextStyle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
