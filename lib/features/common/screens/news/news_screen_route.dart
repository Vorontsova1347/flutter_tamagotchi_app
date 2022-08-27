import 'package:flutter/material.dart';

import '../../domain/entities/image_data.dart';
import 'news_screen.dart';

/// [MaterialPageRoute] для [NewsScreen].
class NewsScreenRoute extends MaterialPageRoute<void> {
  NewsScreenRoute(ImageData data) : super(builder: (ctx) => NewsScreen(data: data,));
}
