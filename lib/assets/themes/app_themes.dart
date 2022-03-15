import 'package:flutter/material.dart';
import 'package:tamagochi_app/assets/colors/app_colors.dart';
import 'package:tamagochi_app/assets/themes/app_typography.dart';

// Тема для отображения текста.
final _textTheme = TextTheme(
  headline1: AppTypography.textNormal18W500,
  headline2: AppTypography.textNormal16W500,
  subtitle1: AppTypography.textNormal14,
  subtitle2: AppTypography.smallBold,
);

/// Стандартная тема приложения
final defaultTheme = ThemeData(
  fontFamily: defaultFontFamily,
  backgroundColor: AppColors.white,
  primaryColor: AppColors.deepLemon,
  textTheme: _textTheme,
);
