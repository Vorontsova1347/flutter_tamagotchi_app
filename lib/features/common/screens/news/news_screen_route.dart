import 'package:flutter/material.dart';
import 'package:tamagochi_app/features/common/domain/entities/image_data.dart';
import 'package:tamagochi_app/features/common/screens/news/news_screen.dart';

/// [MaterialPageRoute] для [NewsScreen].
class NewsScreenRoute extends MaterialPageRoute<void> {
  NewsScreenRoute(ImageData imageData) : super(builder: (ctx) => NewsScreen(imageData));
}
