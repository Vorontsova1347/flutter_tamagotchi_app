import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'btn_event.dart';
part 'btn_state.dart';

class Tamagotchi{
  double cheerfulness = 0.5;
  double satiety = 0.5;
  double healthe = 0.5;
  double play = 0.5;

  Tamagotchi();
}

class BtnBloc extends Bloc<BtnEvent, BtnState> {
  Tamagotchi tamagotchi = Tamagotchi();

  BtnBloc() : super(AddPercentageSuccessful(Tamagotchi())) {
    on<AddPercentageEvent>((event, emit) {

      if (event.param == Param.cheerfulness ){
        tamagotchi.cheerfulness += event.state;
        if (tamagotchi.cheerfulness > 1.0){
          tamagotchi.cheerfulness = 1.0;
        }
      }
      else if (event.param == Param.satiety ){
        tamagotchi.satiety += event.state;
        if (tamagotchi.satiety > 1.0){
          tamagotchi.satiety= 1.0;
        }
      }
      else if (event.param == Param.healthe ){
        tamagotchi.healthe += event.state;
        if (tamagotchi.healthe > 1.0){
          tamagotchi.healthe = 1.0;
        }
      }
      else if (event.param == Param.play ){
        tamagotchi.play += event.state;
        if (tamagotchi.play > 1.0){
          tamagotchi.play = 1.0;
        }
      }
      emit(AddPercentageSuccessful(tamagotchi));
    }
      );

  }

}