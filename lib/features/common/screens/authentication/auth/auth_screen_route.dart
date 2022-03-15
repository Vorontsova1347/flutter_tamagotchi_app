import 'package:flutter/material.dart';
import 'package:tamagochi_app/features/common/screens/authentication/auth/auth_screen.dart';

/// [MaterialPageRoute] для [AuthScreen].
class AuthScreenRoute extends MaterialPageRoute<void> {
  AuthScreenRoute() : super(builder: (ctx) => const AuthScreen());
}
