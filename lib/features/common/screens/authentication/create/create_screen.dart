// ignore_for_file: avoid_bool_literals_in_conditional_expressions

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mwwm/mwwm.dart';
import 'package:relation/relation.dart';
import 'package:tamagochi_app/api/data/data/login/login_data.dart';
import 'package:tamagochi_app/assets/colors/app_colors.dart';
import 'package:tamagochi_app/assets/res/app_icons.dart';
import 'package:tamagochi_app/assets/strings/app_strings.dart';
import 'package:tamagochi_app/assets/themes/app_typography.dart';
import 'package:tamagochi_app/config/screen_util_options.dart';
import 'package:tamagochi_app/features/common/screens/authentication/create/create_screen_widget_model.dart';
import 'package:tamagochi_app/features/common/screens/authentication/create/widgets/radio_item_widget.dart';

class CreateScreen extends CoreMwwmWidget<CreateScreenWidgetModel> {
  final LoginData loginData;
  CreateScreen({
    required this.loginData,
    Key? key,
  }) : super(
          key: key,
          widgetModelBuilder: (ctx) {
            return createCreateScreenWidgetModel(ctx, loginData);
          },
        );

  @override
  WidgetState<CreateScreen, CreateScreenWidgetModel> createWidgetState() =>
      _CreateScreenState();
}

/// [WidgetState] для [CreateScreen]
class _CreateScreenState
    extends WidgetState<CreateScreen, CreateScreenWidgetModel> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: ScreenUtilOptions.designSize,
      minTextAdapt: ScreenUtilOptions.defaultMinTextAdapt,
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

        return SafeArea(
          child: Scaffold(
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
                    AppIcons.arrowBack,
                  ),
                ),
              ),
            ),
            backgroundColor: AppColors.deepLemon,
            body: Center(
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
                      controller: wm.nameTextController,
                      maxLength: wm.nameTextLengthLimit,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(
                          wm.nameTextLengthLimit,
                        ),
                        FilteringTextInputFormatter.allow(
                          RegExp('[a-z A-Z á-ú Á-Ú]'),
                        ),
                      ],
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: AppStrings.nameHintText.toUpperCase(),
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
                  StreamedStateBuilder(
                    streamedState: wm.radioPickState,
                    builder: (ctx, _) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: wm.onRadioFirstTap,
                            child: RadioItemWidget(
                              buttonText: AppStrings.createScreenRadioFirstText
                                  .toUpperCase(),
                              isSelected: wm.radioPickState.value == null
                                  ? false
                                  : wm.radioPickState.value!,
                            ),
                          ),
                          GestureDetector(
                            onTap: wm.onRadioSecondTap,
                            child: RadioItemWidget(
                              buttonText: AppStrings.createScreenRadioSecondText
                                  .toUpperCase(),
                              isSelected: wm.radioPickState.value == null
                                  ? false
                                  : !wm.radioPickState.value!,
                            ),
                          ),
                        ],
                      );
                    },
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
                      child: StreamedStateBuilder(
                        streamedState: wm.loadingState,
                        builder: (context, _) {
                          return wm.loadingState.value
                              ? const Center(
                                  child: CircularProgressIndicator.adaptive(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      AppColors.white,
                                    ),
                                    strokeWidth: 2.0,
                                  ),
                                )
                              : Center(
                                  child: Text(
                                    AppStrings.createScreenButtonText
                                        .toUpperCase(),
                                    style: AppTypography.normalBoldWhite,
                                  ),
                                );
                        },
                      ),
                    ),
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
