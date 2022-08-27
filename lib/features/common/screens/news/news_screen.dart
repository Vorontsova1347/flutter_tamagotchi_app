import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mwwm/mwwm.dart';
import 'package:tamagochi_app/assets/colors/app_colors.dart';
import 'package:tamagochi_app/config/screen_util_options.dart';

import '../../domain/entities/image_data.dart';
import 'news_screen_widget_model.dart';

class NewsScreen extends CoreMwwmWidget<NewsScreenWidgetModel> {
  final ImageData data;

  NewsScreen({
    Key? key,
    required this.data,
  }) : super(
    key: key,
    widgetModelBuilder: (context) => createNewsScreenWidgetModel(context, data),
  );

  @override
  WidgetState<NewsScreen, NewsScreenWidgetModel> createWidgetState() =>
      _NewsScreenState();
}

/// [WidgetState] для [NewsScreen]
class _NewsScreenState extends WidgetState<NewsScreen, NewsScreenWidgetModel> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: ScreenUtilOptions.designSize,
      minTextAdapt: ScreenUtilOptions.defaultMinTextAdapt,
      builder: () {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.transparent,
              elevation: 0,
              title: Text('News ${wm.data.id}'),
            ),
            backgroundColor: AppColors.deepLemon,
            body: Center(
              child: Image.network(wm.data.url),
            ),
          ),
        );
      },
    );
  }
}
