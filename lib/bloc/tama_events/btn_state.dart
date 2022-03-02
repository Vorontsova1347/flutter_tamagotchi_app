part of 'btn_bloc.dart';

@immutable
abstract class BtnState {}

class BtnInitial extends BtnState {}

class AddPercentageSuccessful extends BtnInitial {
  Tamagotchi tamagotchi;

  AddPercentageSuccessful(this.tamagotchi);
}

class AddPercentageProgress extends BtnInitial{

}

class AddPercentageFailed extends BtnInitial {

}
