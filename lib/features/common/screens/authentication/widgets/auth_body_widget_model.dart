import 'package:flutter/material.dart';
import 'package:mwwm/mwwm.dart';
import 'package:tamagochi_app/api/data/registration_data/registration_data.dart';
import 'package:tamagochi_app/features/common/screens/authentication/widgets/auth_body_widget.dart';
import 'package:tamagochi_app/features/navigation/app_router.dart';

/// [WidgetModelBuilder] of [AuthBodyWidgetModel] for [AuthBodyWidget]
// ignore: long-parameter-list
AuthBodyWidgetModel createAuthBodyWidgetModel({
  required String buttonText,
  required TextEditingController loginTextController,
  required TextEditingController passwordTextController,
  required Future<bool> Function(String login, String password) buttonFunction,
  required NavigatorState navigator,
  required bool isLoginScreen,
}) {
  return AuthBodyWidgetModel(
    isLoginScreen: isLoginScreen,
    navigator: navigator,
    loginTextController: loginTextController,
    passwordTextController: passwordTextController,
    buttonText: buttonText,
    buttonFunction: buttonFunction,
  );
}

/// [WidgetModel] for [AuthBodyWidget]
class AuthBodyWidgetModel extends WidgetModel {
  final NavigatorState navigator;
  final TextEditingController loginTextController;
  final TextEditingController passwordTextController;
  final Future<bool> Function(String login, String password) buttonFunction;
  final bool isLoginScreen;
  final String buttonText;

  final loginTextLengthLimit = 24;
  final loginTextLengthMin = 1;
  final passwordTextLengthLimit = 32;
  final passwordTextLengthMin = 4;

  bool _isLoading = false;

  AuthBodyWidgetModel({
    required this.isLoginScreen,
    required this.navigator,
    required this.loginTextController,
    required this.passwordTextController,
    required this.buttonFunction,
    required this.buttonText,
  }) : super(const WidgetModelDependencies());

  Future<void> onButtonTap() async {
    if (!_isLoading) {
      final login = _getLogin();
      final password = _getPassword();

      if (_isValidLogin(login) && _isValidPassword(password)) {
        _isLoading = true;

        if (isLoginScreen) {
          await _loginCycle(login, password);
        } else {
          await _signinCycle(login, password);
        }

        _isLoading = false;
      }
    }
  }

  Future<void> _loginCycle(String login, String password) async {
    if (await buttonFunction(
      login,
      password,
    )) {
      await navigator.pushReplacementNamed(AppRouter.mainScreen);
    }
    _clearPassword();
  }

  Future<void> _signinCycle(String login, String password) async {
    await buttonFunction(login, password);

    await navigator.pushNamed(
      AppRouter.createScreen,
      arguments: RegistrationData(
        name: login,
        password: password,
      ),
    );
  }

  bool _isValidLogin(String login) {
    return login.length >= loginTextLengthMin;
  }

  bool _isValidPassword(String password) {
    return password.length >= passwordTextLengthMin;
  }

  String _getLogin() => loginTextController.value.text;
  String _getPassword() => passwordTextController.value.text;
  void _clearPassword() => passwordTextController.clear();
}
