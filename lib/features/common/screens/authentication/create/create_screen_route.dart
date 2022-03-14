import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tamagochi_app/api/data/login_data/login_data.dart';
import 'package:tamagochi_app/features/common/screens/authentication/create/create_screen.dart';

/// [MaterialPageRoute] for [CreateScreen].
class CreateScreenRoute extends MaterialPageRoute<void> {
  CreateScreenRoute(LoginData loginData)
      : super(
          builder: (ctx) => CreateScreen(
            loginData: loginData,
          ),
        );
}
