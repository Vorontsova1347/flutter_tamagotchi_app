import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mwwm/mwwm.dart';
import 'package:relation/relation.dart';
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

/// [WidgetState] для [MainScreen]
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
  final centerLogoWidth = 160.0.w;
  final centerLogoHeight = 160.0.h;
  final statusButtonsSize = 68.0.r;
  final newsIconSize = 48.0.r;

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
              child: StreamedStateBuilder(
                streamedState: wm.tamagochiState,
                builder: (context, _) {
                  return wm.tamagochiState.value == null
                      ? const Center(
                          child: CircularProgressIndicator.adaptive(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(AppColors.black),
                            strokeWidth: 2.0,
                          ),
                        )
                      : Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: wm.onCrossTap,
                                  child: SvgPicture.asset(
                                    AppIcons.crossExit,
                                    height: crossExitHeight,
                                    width: crossExitWidth,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: wm.onNewsTap,
                                  child: SizedBox(
                                    height: crossExitHeight,
                                    width: crossExitHeight,
                                    child: Icon(
                                      Icons.notifications,
                                      color: Colors.black,
                                      size: newsIconSize,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: sizeBetweenStatusAndCross),
                            Text(
                              AppStrings.mainScreenGeneralStateText
                                  .toUpperCase(),
                              style: AppTypography.mainScreenStatusTextStyle,
                            ),
                            SizedBox(height: sizeBetweenStatusHeight),
                            SizedBox(
                              height: generalStateBarHeight,
                              width: generalStateBarWidth,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  generalStateBarBorderRadius,
                                ),
                                child: LinearProgressIndicator(
                                  color: AppColors.darkTurquoise,
                                  backgroundColor: AppColors.platinum,
                                  value: wm.tamagochiState.value!.generalState,
                                ),
                              ),
                            ),
                            SizedBox(height: sizeBetweenStatusAndCross),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      AppStrings.mainScreenGameText
                                          .toUpperCase(),
                                      style: AppTypography
                                          .mainScreenStatusTextStyle,
                                    ),
                                    SizedBox(
                                      height: sizeBetweenStatusHeight,
                                    ),
                                    SizedBox(
                                      height: generalStateBarHeight,
                                      width: otherStatesWidth,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                          generalStateBarBorderRadius,
                                        ),
                                        child: LinearProgressIndicator(
                                          color: AppColors.mediumVioletRed,
                                          backgroundColor: AppColors.platinum,
                                          value: wm.tamagochiState.value!.game,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: sizeBetweenStatusWidth),
                                Column(
                                  children: [
                                    Text(
                                      AppStrings.mainScreenFoodText
                                          .toUpperCase(),
                                      style: AppTypography
                                          .mainScreenStatusTextStyle,
                                    ),
                                    SizedBox(
                                      height: sizeBetweenStatusHeight,
                                    ),
                                    SizedBox(
                                      height: generalStateBarHeight,
                                      width: otherStatesWidth,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                          generalStateBarBorderRadius,
                                        ),
                                        child: LinearProgressIndicator(
                                          color: AppColors.aoEnglish,
                                          backgroundColor: AppColors.platinum,
                                          value: wm.tamagochiState.value!.food,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: sizeBetweenStatusAndCross),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      AppStrings.mainScreenHealthText
                                          .toUpperCase(),
                                      style: AppTypography
                                          .mainScreenStatusTextStyle,
                                    ),
                                    SizedBox(height: sizeBetweenStatusHeight),
                                    SizedBox(
                                      height: generalStateBarHeight,
                                      width: otherStatesWidth,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                          generalStateBarBorderRadius,
                                        ),
                                        child: LinearProgressIndicator(
                                          color: AppColors.pastelYellow,
                                          backgroundColor: AppColors.platinum,
                                          value:
                                              wm.tamagochiState.value!.health,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: sizeBetweenStatusWidth),
                                Column(
                                  children: [
                                    Text(
                                      AppStrings.mainScreenSleepText
                                          .toUpperCase(),
                                      style: AppTypography
                                          .mainScreenStatusTextStyle,
                                    ),
                                    SizedBox(height: sizeBetweenStatusHeight),
                                    SizedBox(
                                      height: generalStateBarHeight,
                                      width: otherStatesWidth,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                          generalStateBarBorderRadius,
                                        ),
                                        child: LinearProgressIndicator(
                                          color: AppColors.palatinateBlue,
                                          backgroundColor: AppColors.platinum,
                                          value: wm.tamagochiState.value!.sleep,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: sizeBetweenStatusAndCross),
                            SvgPicture.asset(
                              () {
                                return wm.isBoy
                                    ? AppIcons.profilePictureBoy
                                    : AppIcons.profilePictureGirl;
                              }(),
                              height: centerLogoHeight,
                              width: centerLogoWidth,
                            ),
                            SizedBox(height: sizeBetweenStatusAndCross),
                            Text(
                              wm.name.toUpperCase(),
                              style: AppTypography.uberBoldBlack,
                            ),
                            SizedBox(height: sizeBetweenStatusAndCross),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: wm.onGameTap,
                                  child: SvgPicture.asset(
                                    AppIcons.statusGame,
                                    height: statusButtonsSize,
                                    width: statusButtonsSize,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: wm.onHealthTap,
                                  child: SvgPicture.asset(
                                    AppIcons.statusHealth,
                                    height: statusButtonsSize,
                                    width: statusButtonsSize,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: wm.onFoodTap,
                                  child: SvgPicture.asset(
                                    AppIcons.statusFood,
                                    height: statusButtonsSize,
                                    width: statusButtonsSize,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: wm.onSleepTap,
                                  child: SvgPicture.asset(
                                    AppIcons.statusSleep,
                                    height: statusButtonsSize,
                                    width: statusButtonsSize,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
