import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mwwm/mwwm.dart';
import 'package:tamagochi_app/features/common/screens/splash/splash_screen_widget_model.dart';

/// [Widget] of splash screen
class SplashScreen extends CoreMwwmWidget<SplashScreenWidgetModel> {
  const SplashScreen({
    Key? key,
  }) : super(
          key: key,
          widgetModelBuilder: createSplashScreenWidgetModel,
        );

  @override
  WidgetState<SplashScreen, SplashScreenWidgetModel> createWidgetState() =>
      _SplashScreenState();
}

/// [WidgetState] of [SplashScreen]
class _SplashScreenState
    extends WidgetState<SplashScreen, SplashScreenWidgetModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: wm.scaffoldKey,
      backgroundColor: wm.backgroundColor,
      body: Center(
        child: FadeTransition(
          opacity: wm.fadeController,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                wm.titleTopText,
                style: wm.titleStyle,
              ),
              Text(
                wm.titleBottomText,
                style: wm.titleStyle,
              ),
              SvgPicture.asset(
                wm.logoPath,
                height: wm.logoHeight,
                width: wm.logoWidth,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
