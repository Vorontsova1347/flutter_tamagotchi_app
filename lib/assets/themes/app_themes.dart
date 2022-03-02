import 'package:flutter/material.dart';
import 'package:tamagochi_app/assets/colors/app_colors.dart';
import 'package:tamagochi_app/assets/themes/app_typography.dart';

/// Стандартная тема приложения
final defaultTheme = ThemeData(
  fontFamily: defaultFontFamily,
  backgroundColor: AppColors.brightGray,
  textTheme: _textTheme,
  highlightColor: AppColors.gunmetal,
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.gray11),
);

// Тема для отображения текста.
final _textTheme = TextTheme(
  headline1: AppTypography.textNormal18W500,
  headline2: AppTypography.textNormal16W500,
  subtitle1: AppTypography.textNormal14,
  subtitle2: AppTypography.smallBold,
);
