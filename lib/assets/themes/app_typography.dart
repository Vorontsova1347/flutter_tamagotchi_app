import 'package:flutter/material.dart';
import 'package:tamagochi_app/assets/colors/app_colors.dart';

const defaultFontFamily = 'Roboto';

///TODO(svetlana): update temp textStyle
/// Стили текста.
class AppTypography {
  static const textNormal = TextStyle(
    fontWeight: FontWeight.normal,
    fontFamily: defaultFontFamily,
  );
  static const textBold = TextStyle(
    fontWeight: FontWeight.bold,
    fontFamily: defaultFontFamily,
  );
  static const text500 = TextStyle(
    fontWeight: FontWeight.w500,
    fontFamily: defaultFontFamily,
  );
  static final textNormal18W500 = text500.copyWith(
    fontSize: 18.0,
    color: AppColors.gunmetal,
    height: 24.0 / 18.0,
  );
  static final textNormal16W500 = text500.copyWith(
    fontSize: 16.0,
    color: AppColors.gray11,
    height: 20.0 / 16.0,
  );
  static final textNormal14 = textNormal.copyWith(
    fontSize: 14.0,
    color: AppColors.brightGray,
    height: 18.0 / 14.0,
  );
  static final smallBold = textBold.copyWith(
    fontSize: 14.0,
    color: AppColors.white,
  );
  static final hugeBold = textBold.copyWith(
    fontSize: 24.0,
    color: AppColors.gunmetal,
  );
}
