import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamagochi_app/assets/colors/app_colors.dart';
import 'package:tamagochi_app/assets/themes/app_typography.dart';

// Радио-кнопка выбора пола
class RadioItemWidget extends StatelessWidget {
  final String buttonText;
  final bool isSelected;

  const RadioItemWidget({
    Key? key,
    required this.buttonText,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widgetRadius = 10.0.r;
    final widgetHeight = 42.0.h;
    final widgetWidth = 116.0.w;

    return Container(
      margin: const EdgeInsets.all(15.0),
      child: Container(
        height: widgetHeight,
        width: widgetWidth,
        child: Center(
          child: Text(
            buttonText,
            style: AppTypography.createScreenRadioButtonTextStyle,
          ),
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.black : AppColors.violinBrown,
          borderRadius: BorderRadius.circular(widgetRadius),
        ),
      ),
    );
  }
}
