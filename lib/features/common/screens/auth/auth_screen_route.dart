import 'package:flutter/material.dart';
import 'package:tamagochi_app/features/common/screens/auth/auth_screen.dart';

/// [MaterialPageRoute] for [AuthScreen].
class AuthScreenRoute extends MaterialPageRoute<void> {
  AuthScreenRoute() : super(builder: (ctx) => const AuthScreen());
}
