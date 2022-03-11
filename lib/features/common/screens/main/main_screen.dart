import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mwwm/mwwm.dart';
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
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(wm.designWidth, wm.designHeight),
      minTextAdapt: wm.minTextAdapt,
      builder: () {
        final appBarHeight = 50.0.h;
        final arrowBackPadding = 12.0.r;
        final logoHeight = 160.0.r;
        final logoWidth = 160.0.r;
        final buttonRadius = 10.0.r;
        final buttonHeight = 42.0.h;
        final buttonWidth = 184.0.w;
        final textfieldHeight = 42.0.h;
        final textfieldWidth = 320.0.w;
        final sizedBoxTopHeight = 42.h;
        final betweenFieldsHeight = 24.h;

        return Scaffold();
      },
    );
  }
}
