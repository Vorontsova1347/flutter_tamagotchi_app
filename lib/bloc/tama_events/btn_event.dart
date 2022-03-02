part of 'btn_bloc.dart';

@immutable
abstract class BtnEvent {}
enum Param{cheerfulness, satiety, healthe, play}

class AddPercentageEvent extends BtnEvent {
  final double state = 0.2;

  Param param;

  AddPercentageEvent(this.param);
}

