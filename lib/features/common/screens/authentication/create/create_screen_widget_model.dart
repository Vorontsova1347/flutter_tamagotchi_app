import 'package:flutter/material.dart';
import 'package:mwwm/mwwm.dart';
import 'package:relation/relation.dart';
import 'package:surf_injector/surf_injector.dart';
import 'package:tamagochi_app/api/data/registration_data/registration_data.dart';
import 'package:tamagochi_app/features/app/di/app_component.dart';
import 'package:tamagochi_app/features/common/domain/interactors/tamagochi/tamagochi_interactor.dart';
import 'package:tamagochi_app/features/common/domain/interactors/user/user_interactor.dart';
import 'package:tamagochi_app/features/common/domain/repository/tamagochi/tamagochi_repository.dart';
import 'package:tamagochi_app/features/common/screens/authentication/create/create_screen.dart';
import 'package:tamagochi_app/features/navigation/app_router.dart';

/// [WidgetModelBuilder] of [CreateScreenWidgetModel] for [CreateScreen]
CreateScreenWidgetModel createCreateScreenWidgetModel(
    BuildContext context, RegistrationData registrationData) {
  return CreateScreenWidgetModel(
    registrationData: registrationData,
    navigator:
        Injector.of<AppComponent>(context).component.navigator.currentState!,
    userInteractor: Injector.of<AppComponent>(context).component.userInteractor,
    tamagochiInteractor:
        Injector.of<AppComponent>(context).component.tamagochiInteractor,
  );
}

class CreateScreenWidgetModel extends WidgetModel {
  final nameTextController = TextEditingController();
  final radioPickState = StreamedState<bool?>(null);
  final nameTextLengthLimit = 24;
  final nameTextLengthMin = 1;
  final RegistrationData registrationData;
  final NavigatorState navigator;
  final UserInteractor userInteractor;
  final TamagochiInteractor tamagochiInteractor;

  bool _isLoading = false;

  CreateScreenWidgetModel({
    required this.tamagochiInteractor,
    required this.userInteractor,
    required this.registrationData,
    required this.navigator,
  }) : super(const WidgetModelDependencies());

  void onArrowBackTap() {
    navigator.pop();
  }

  Future<void> onRadioFirstTap() async {
    if (radioPickState.value == null || radioPickState.value == false) {
      await radioPickState.accept(true);
    }
  }

  Future<void> onRadioSecondTap() async {
    if (radioPickState.value == null || radioPickState.value == true) {
      await radioPickState.accept(false);
    }
  }

  Future<void> onButtonTap() async {
    if (!_isLoading) {
      _isLoading = true;
      if (radioPickState.value != null || !_isValidName(_getName())) {
        await userInteractor.userRegister(registrationData);
        if (await userInteractor.tryToLogin(
          login: registrationData.name,
          password: registrationData.password,
        )) {
          await tamagochiInteractor.updateTamagochi(sleep: 0, health: 0, game: 0, food: food)
          await await navigator.pushReplacementNamed(AppRouter.mainScreen);
        }
      }
      _isLoading = false;
    }
  }

  bool _isValidName(String name) {
    return name.length > nameTextLengthMin;
  }

  String _getName() => nameTextController.value.text;
}
