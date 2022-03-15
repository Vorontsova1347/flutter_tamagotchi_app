import 'package:flutter/material.dart';
import 'package:tamagochi_app/features/common/screens/authentication/sign/sign_screen.dart';

/// [MaterialPageRoute] для [SignScreen].
class SignScreenRoute extends MaterialPageRoute<void> {
  SignScreenRoute() : super(builder: (ctx) => const SignScreen());
}
