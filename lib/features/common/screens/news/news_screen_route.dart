import 'package:flutter/material.dart';

import 'news_screen.dart';

/// [MaterialPageRoute] для [NewsScreen].
class NewsScreenRoute extends MaterialPageRoute<void> {
  NewsScreenRoute(int id) : super(builder: (ctx) => NewsScreen(id: id,));
}
