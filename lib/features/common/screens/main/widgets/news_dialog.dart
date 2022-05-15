// ignore_for_file: long-method

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamagochi_app/assets/colors/app_colors.dart';
import 'package:tamagochi_app/assets/themes/app_typography.dart';
import 'package:tamagochi_app/features/common/domain/entities/image_data.dart';

// Окно новостей с картинками
Future<void> showNewsDialog(
    BuildContext context,
    List<ImageData> newsData,
    Function(ImageData imageData) onNewsTap,
) async {
  final contentHeight = 800.0.h;
  final contentWidth = 360.0.w;

  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (context) {
      return AlertDialog(
        backgroundColor: AppColors.deepLemon,
        title: Text(
          'News',
          style: AppTypography.uberBoldBlack,
        ),
        content: SingleChildScrollView(
          child: () {
            return newsData.isEmpty
                ? SizedBox(
                    height: contentHeight,
                    width: contentWidth,
                    child: Text(
                      'Nothing to show',
                      style:
                          AppTypography.smallBold.copyWith(color: Colors.black),
                    ),
                  )
                : CarouselSlider.builder(
                    itemCount: newsData.length,
                    itemBuilder: (ctx, index, _) {
                      return GestureDetector(
                        onTap: () {
                          onNewsTap(newsData[index]);
                        },
                        child: Center(
                          child: Image.network(
                            newsData[index].url,
                            fit: BoxFit.cover,
                            height: contentHeight,
                            loadingBuilder: (
                              context,
                              child,
                              loadingProgress,
                            ) {
                              if (loadingProgress == null) return child;

                              return Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.black,
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                    options: CarouselOptions(
                      aspectRatio: 2.0,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      scrollDirection: Axis.vertical,
                      autoPlay: true,
                    ),
                  );
          }(),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              'close',
              style: AppTypography.normalBoldBlack,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
