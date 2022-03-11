import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mwwm/mwwm.dart';
import 'package:tamagochi_app/assets/colors/app_colors.dart';
import 'package:tamagochi_app/assets/res/app_icons.dart';
import 'package:tamagochi_app/assets/strings/app_strings.dart';
import 'package:tamagochi_app/assets/themes/app_typography.dart';
import 'package:tamagochi_app/features/common/screens/authentication/widgets/auth_body_widget_model.dart';

class AuthBodyWidget extends CoreMwwmWidget<AuthBodyWidgetModel> {
  final String buttonText;
  final Future<bool> Function(String login, String password) buttonFunction;
  final TextEditingController loginTextController;
  final TextEditingController passwordTextController;
  final NavigatorState navigator;
  final bool isLoginScreen;

  AuthBodyWidget({
    required this.navigator,
    required this.loginTextController,
    required this.passwordTextController,
    required this.buttonText,
    required this.buttonFunction,
    required this.isLoginScreen,
    Key? key,
  }) : super(
          key: key,
          widgetModelBuilder: (_) => createAuthBodyWidgetModel(
            isLoginScreen: isLoginScreen,
            navigator: navigator,
            loginTextController: loginTextController,
            passwordTextController: passwordTextController,
            buttonFunction: buttonFunction,
            buttonText: buttonText,
          ),
        );

  @override
  WidgetState<AuthBodyWidget, AuthBodyWidgetModel> createWidgetState() =>
      _AuthBodyWidgetState();
}

/// [WidgetState] of [AuthBodyWidget
class _AuthBodyWidgetState
    extends WidgetState<AuthBodyWidget, AuthBodyWidgetModel> {
  @override
  Widget build(BuildContext context) {
    final logoHeight = 160.0.r;
    final logoWidth = 160.0.r;
    final buttonRadius = 10.0.r;
    final buttonHeight = 42.0.h;
    final buttonWidth = 184.0.w;
    final textfieldHeight = 42.0.h;
    final textfieldWidth = 320.0.w;
    final sizedBoxTopHeight = 42.h;
    final sizedBoxBottomHeight = 18.h;
    final betweenFieldsHeight = 24.h;

    return Center(
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
          Container(
            height: textfieldHeight,
            width: textfieldWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(buttonRadius),
            ),
            child: TextFormField(
              style: AppTypography.normalBoldViolinBrown,
              controller: wm.loginTextController,
              maxLength: wm.loginTextLengthLimit,
              inputFormatters: [
                LengthLimitingTextInputFormatter(wm.loginTextLengthLimit),
                FilteringTextInputFormatter.allow(
                  RegExp('[a-zA-Zá-úÁ-Ú]'),
                ),
              ],
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: AppStrings.loginHintText.toUpperCase(),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: textfieldHeight / 3,
                  vertical: textfieldHeight / 10,
                ),
                counterText: '',
                border: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(),
                disabledBorder: const OutlineInputBorder(),
                enabledBorder: const OutlineInputBorder(),
                fillColor: AppColors.deepLemon,
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
              style: AppTypography.normalBoldViolinBrown,
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
                hintText: AppStrings.passwordHintText.toUpperCase(),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: textfieldHeight / 3,
                  vertical: textfieldHeight / 10, 
                ),
                counterText: '',
                focusedBorder: const OutlineInputBorder(),
                disabledBorder: const OutlineInputBorder(),
                enabledBorder: const OutlineInputBorder(),
                fillColor: AppColors.deepLemon,
                filled: true,
              ),
            ),
          ),
          SizedBox(
            height: sizedBoxBottomHeight,
          ),
          GestureDetector(
            onTap: wm.onButtonTap,
            child: Container(
              height: buttonHeight,
              width: buttonWidth,
              decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.circular(buttonRadius),
              ),
              child: Center(
                child: Text(
                  wm.buttonText,
                  style: AppTypography.normalBoldWhite,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
