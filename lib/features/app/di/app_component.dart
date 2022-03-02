import 'package:flutter/material.dart';
import 'package:surf_injector/surf_injector.dart';

/// [Component] для зависимостей всего приложения
class AppComponent extends Component {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final navigator = GlobalKey<NavigatorState>();
}