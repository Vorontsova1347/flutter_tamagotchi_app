import 'package:flutter/material.dart';
import 'package:mwwm/mwwm.dart';
import 'package:surf_injector/surf_injector.dart';
import 'package:tamagochi_app/api/data/data/login/login_data.dart';
import 'package:tamagochi_app/features/app/di/app_component.dart';
import 'package:tamagochi_app/features/common/domain/interactors/user/user_interactor.dart';
import 'package:tamagochi_app/features/common/screens/authentication/login/login_screen.dart';


/// Фабрика для создания [WidgetModel] для[LoginScreen]
LoginScreenWidgetModel createLoginScreenWidgetModel(BuildContext context) {
  return LoginScreenWidgetModel(
    navigator:
        Injector.of<AppComponent>(context).component.navigator.currentState!,
    userInteractor: Injector.of<AppComponent>(context).component.userInteractor,
  );
}

///  [WidgetModel] для  [LoginScreen]
class LoginScreenWidgetModel extends WidgetModel {
  final loginTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  final UserInteractor userInteractor;
  final NavigatorState navigator;

  LoginScreenWidgetModel({
    required this.userInteractor,
    required this.navigator,
  }) : super(const WidgetModelDependencies());

  @override
  void dispose() {
    super.dispose();

    loginTextController.dispose();
    passwordTextController.dispose();
  }

  void onArrowBackTap() {
    navigator.pop();
  }

  Future<bool> loginUp(String login, String password) async {
    return userInteractor.login(
      loginData: LoginData(login: login, password: password),
    );
  }
}
