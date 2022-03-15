import 'package:flutter/material.dart';
import 'package:mwwm/mwwm.dart';
import 'app.dart';

/// Фабрика для создания [WidgetModel] для [App]
AppWidgetModel createAppWidgetModel(BuildContext _) {
  return AppWidgetModel();
}

/// [WidgetModel] для [App]
class AppWidgetModel extends WidgetModel {
  AppWidgetModel() : super(const WidgetModelDependencies());
}
