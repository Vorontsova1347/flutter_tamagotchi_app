import 'package:flutter/material.dart';
import 'package:mwwm/mwwm.dart';
import 'package:relation/relation.dart';
import 'package:surf_injector/surf_injector.dart';
import 'package:tamagochi_app/api/data/login_data/login_data.dart';
import 'package:tamagochi_app/api/data/registration_data/registration_data.dart';
import 'package:tamagochi_app/features/app/di/app_component.dart';
import 'package:tamagochi_app/features/common/domain/interactors/tamagochi/tamagochi_interactor.dart';
import 'package:tamagochi_app/features/common/domain/interactors/user/user_interactor.dart';
import 'package:tamagochi_app/features/common/screens/authentication/create/create_screen.dart';
import 'package:tamagochi_app/features/navigation/app_router.dart';
import 'package:string_validator/string_validator.dart';

/// [WidgetModelBuilder] of [CreateScreenWidgetModel] for [CreateScreen]
CreateScreenWidgetModel createCreateScreenWidgetModel(
  BuildContext context,
  LoginData loginData,
) {
  return CreateScreenWidgetModel(
    loginData: loginData,
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
  final loadingState = StreamedState<bool>(false);

  final nameTextLengthLimit = 12;
  final nameTextLengthMin = 2;
  final LoginData loginData;
  final NavigatorState navigator;
  final UserInteractor userInteractor;
  final TamagochiInteractor tamagochiInteractor;

  bool _isLoading = false;

  CreateScreenWidgetModel({
    required this.tamagochiInteractor,
    required this.userInteractor,
    required this.loginData,
    required this.navigator,
  }) : super(const WidgetModelDependencies());

  void onArrowBackTap() {
    navigator.pop();
  }

  Future<void> onRadioFirstTap() async {
    await radioPickState.accept(true);
  }

  Future<void> onRadioSecondTap() async {
    await radioPickState.accept(false);
  }

  Future<void> onButtonTap() async {
    if (!loadingState.value) {
      await loadingState.accept(true);
      final tamagochiName = _getName();
      if (radioPickState.value != null && _isValidName(tamagochiName)) {
        await userInteractor.register(
          RegistrationData(
            login: loginData.login,
            password: loginData.password,
            tamagochi_name: tamagochiName,
            tamagochi_gender: _getGender(),
          ),
        );

        if (await userInteractor.login(
          loginData: loginData,
        )) {
          await navigator.pushReplacementNamed(AppRouter.mainScreen);
        }
      }

      await loadingState.accept(false);
    }
  }

  bool _isValidName(String name) {
    return isLength(name, nameTextLengthMin, nameTextLengthLimit) &&
        isAlpha(name);
  }

  String _getName() => nameTextController.value.text;

  String _getGender() => radioPickState.value != null ? 'Boy' : 'Girl';
}
