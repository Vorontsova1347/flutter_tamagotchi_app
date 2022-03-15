import 'package:flutter/material.dart';
import 'package:tamagochi_app/features/common/screens/authentication/login/login_screen.dart';

/// [MaterialPageRoute] для [LoginScreen].
class LoginScreenRoute extends MaterialPageRoute<void> {
  LoginScreenRoute() : super(builder: (ctx) => const LoginScreen());
}
