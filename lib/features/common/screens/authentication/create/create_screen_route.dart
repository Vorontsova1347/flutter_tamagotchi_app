import 'package:flutter/material.dart';
import 'package:tamagochi_app/api/data/registration_data/registration_data.dart';
import 'package:tamagochi_app/features/common/screens/authentication/create/create_screen.dart';

/// [MaterialPageRoute] for [CreateScreen].
class CreateScreenRoute extends MaterialPageRoute<void> {
  CreateScreenRoute(RegistrationData registrationData)
      : super(
          builder: (ctx) => CreateScreen(
            registrationData: registrationData,
          ),
        );
}
