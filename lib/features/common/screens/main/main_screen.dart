import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mwwm/mwwm.dart';
import 'package:tamagochi_app/assets/colors/app_colors.dart';
import 'package:tamagochi_app/assets/res/app_icons.dart';
import 'package:tamagochi_app/assets/strings/app_strings.dart';
import 'package:tamagochi_app/assets/themes/app_typography.dart';
import 'package:tamagochi_app/config/screen_util_options.dart';
import 'package:tamagochi_app/features/common/screens/main/main_screen_widget_model.dart';

class MainScreen extends CoreMwwmWidget<MainScreenWidgetModel> {
  const MainScreen({
    Key? key,
  }) : super(
          key: key,
          widgetModelBuilder: createMainScreenWidgetModel,
        );

  @override
  WidgetState<MainScreen, MainScreenWidgetModel> createWidgetState() =>
      _MainScreenState();
}

/// [WidgetState] of [MainScreen]
class _MainScreenState extends WidgetState<MainScreen, MainScreenWidgetModel> {
  final crossExitHeight = 48.0.r;
  final crossExitWidth = 48.0.r;
  final verticalPadding = 15.0.r;
  final horizontalPadding = 20.0.r;
  final generalStateBarWidth = 320.0.w;
  final otherStatesWidth = 116.0.w;
  final generalStateBarHeight = 20.0.h;
  final generalStateBarBorderRadius = 10.0.r;
  final sizeBetweenStatusAndCross = 17.0.h;
  final sizeBetweenStatusHeight = 4.0.h;
  final sizeBetweenStatusWidth = 88.0.w;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: ScreenUtilOptions.designSize,
      minTextAdapt: ScreenUtilOptions.defaultMinTextAdapt,
      builder: () {
        return SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.deepLemon,
            body: Padding(
              padding: EdgeInsets.symmetric(
                vertical: verticalPadding,
                horizontal: horizontalPadding,
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: wm.onCrossTap,
                      child: SvgPicture.asset(
                        AppIcons.crossExit,
                        height: crossExitHeight,
                        width: crossExitWidth,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: sizeBetweenStatusAndCross,
                  ),
                  Text(
                    AppStrings.mainScreenGeneralStateText.toUpperCase(),
                    style: AppTypography.mainScreenStatusTextStyle,
                  ),
                  SizedBox(
                    height: sizeBetweenStatusHeight,
                  ),
                  Container(
                    height: generalStateBarHeight,
                    width: generalStateBarWidth,
                    decoration: BoxDecoration(
                      color: AppColors.platinum,
                      borderRadius:
                          BorderRadius.circular(generalStateBarBorderRadius),
                      border: Border.all(
                        color: AppColors.silverSand,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: sizeBetweenStatusAndCross,
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            AppStrings.mainScreenGameText.toUpperCase(),
                            style: AppTypography.mainScreenStatusTextStyle,
                          ),
                          SizedBox(
                            height: sizeBetweenStatusHeight,
                          ),
                          Container(
                            height: generalStateBarHeight,
                            width: otherStatesWidth,
                            decoration: BoxDecoration(
                              color: AppColors.platinum,
                              borderRadius: BorderRadius.circular(
                                generalStateBarBorderRadius,
                              ),
                              border: Border.all(
                                color: AppColors.silverSand,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: sizeBetweenStatusWidth,
                      ),
                      Column(
                        children: [
                          Text(
                            AppStrings.mainScreenFoodText.toUpperCase(),
                            style: AppTypography.mainScreenStatusTextStyle,
                          ),
                          SizedBox(
                            height: sizeBetweenStatusHeight,
                          ),
                          Container(
                            height: generalStateBarHeight,
                            width: otherStatesWidth,
                            child: LinearProgressIndicator(),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: sizeBetweenStatusAndCross,
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            AppStrings.mainScreenHealthText.toUpperCase(),
                            style: AppTypography.mainScreenStatusTextStyle,
                          ),
                          SizedBox(
                            height: sizeBetweenStatusHeight,
                          ),
                          Container(
                            height: generalStateBarHeight,
                            width: otherStatesWidth,
                            decoration: BoxDecoration(
                              color: AppColors.platinum,
                              borderRadius: BorderRadius.circular(
                                generalStateBarBorderRadius,
                              ),
                              border: Border.all(
                                color: AppColors.silverSand,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: sizeBetweenStatusWidth,
                      ),
                      Column(
                        children: [
                          Text(
                            AppStrings.mainScreenSleepText.toUpperCase(),
                            style: AppTypography.mainScreenStatusTextStyle,
                          ),
                          SizedBox(
                            height: sizeBetweenStatusHeight,
                          ),
                          Container(
                            height: generalStateBarHeight,
                            width: otherStatesWidth,
                            decoration: BoxDecoration(
                              color: AppColors.platinum,
                              borderRadius: BorderRadius.circular(
                                generalStateBarBorderRadius,
                              ),
                              border: Border.all(
                                color: AppColors.silverSand,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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
