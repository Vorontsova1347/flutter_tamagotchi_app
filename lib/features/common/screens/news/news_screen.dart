import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mwwm/mwwm.dart';
import 'package:relation/relation.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tamagochi_app/assets/colors/app_colors.dart';
import 'package:tamagochi_app/config/screen_util_options.dart';

import 'news_screen_widget_model.dart';

class NewsScreen extends CoreMwwmWidget<NewsScreenWidgetModel> {
  final int id;

  NewsScreen({
    Key? key,
    required this.id,
  }) : super(
          key: key,
          widgetModelBuilder: (context) =>
              createNewsScreenWidgetModel(context, id),
        );

  @override
  WidgetState<NewsScreen, NewsScreenWidgetModel> createWidgetState() =>
      _NewsScreenState();
}

/// [WidgetState] для [NewsScreen]
class _NewsScreenState extends WidgetState<NewsScreen, NewsScreenWidgetModel> {
  @override
  Widget build(BuildContext context) {
    log('A/B test color: ${wm.firebaseBackgroundColor}');

    return ScreenUtilInit(
      designSize: ScreenUtilOptions.designSize,
      minTextAdapt: ScreenUtilOptions.defaultMinTextAdapt,
      builder: () {
        return SafeArea(
          child: StreamedStateBuilder(
            streamedState: wm.data,
            builder: (context, data) => Scaffold(
              appBar: AppBar(
                backgroundColor: AppColors.transparent,
                elevation: 0,
                title: data == null
                    ? const Text('Still loading...')
                    : (wm.data.value?.title != null
                        ? Text(wm.data.value!.title!)
                        : Text('News ${wm.data.value!.id}')),
                actions: [
                  if (data != null)
                    IconButton(
                      onPressed: () {
                        Share.share(
                          wm.generateLinkOnNews,
                          subject: wm.generateLinkOnNews,
                        );
                      },
                      icon: const Icon(Icons.share),
                    ),
                ],
              ),
              backgroundColor: wm.firebaseBackgroundColor == 'red'
                  ? AppColors.candyAppleRed
                  : AppColors.deepLemon,
              body: Center(
                child: data == null
                    ? const CircularProgressIndicator()
                    : Column(
                        children: [
                          Image.network(wm.data.value!.url),
                          if (wm.data.value?.text != null)
                            Text(wm.data.value!.text!),
                        ],
                      ),
              ),
            ),
          ),
        );
      },
    );
  }
}
