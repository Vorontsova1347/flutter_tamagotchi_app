import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mwwm/mwwm.dart';
import 'package:tamagochi_app/assets/colors/app_colors.dart';
import 'package:tamagochi_app/assets/res/app_icons.dart';
import 'package:tamagochi_app/config/screen_util_options.dart';
import 'package:tamagochi_app/features/common/domain/entities/image_data.dart';
import 'package:tamagochi_app/features/common/screens/news/news_screen_widget_model.dart';

class NewsScreen extends CoreMwwmWidget<NewsScreenWidgetModel> {
  final ImageData imageData;

  const NewsScreen(
      this.imageData,
      {
        Key? key,
      }) : super(
          key: key,
          widgetModelBuilder: createMainScreenWidgetModel,
        );

  @override
  WidgetState<NewsScreen, NewsScreenWidgetModel> createWidgetState() =>
      _NewsScreenState();
}

/// [WidgetState] для [NewsScreen]
class _NewsScreenState extends WidgetState<NewsScreen, NewsScreenWidgetModel> {
  final crossExitHeight = 48.0.r;
  final crossExitWidth = 48.0.r;
  final verticalPadding = 15.0.r;
  final horizontalPadding = 20.0.r;

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: wm.onBackTap,
                        child: SvgPicture.asset(
                          AppIcons.arrowBack,
                          height: crossExitHeight,
                          width: crossExitWidth,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          wm.onShareTap(widget.imageData.url);
                        },
                        child: SizedBox(
                          height: crossExitHeight,
                          width: crossExitHeight,
                          child: SvgPicture.asset(
                            AppIcons.arrowBack,
                            height: crossExitHeight,
                            width: crossExitWidth,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: verticalPadding,),
                  Image.network(
                    widget.imageData.url,
                    fit: BoxFit.cover,
                    loadingBuilder: (
                        context,
                        child,
                        loadingProgress,
                        ) {
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return Center(
                          child: CircularProgressIndicator(
                            color: AppColors.black,
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      }
                    },
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
