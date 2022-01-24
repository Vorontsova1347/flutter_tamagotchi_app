import 'dart:async';
import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:flutter_app/model/user.dart';
import 'package:flutter_app/repository/user_rep.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserRep userRep;
  Future<User?> get user async => await userRep.user;

  UserBloc(this.userRep) : super(UserInitial()) {

    on<AuthorizationEvent>((event, emit) async {
      // TODO: implement event handler
      await userRep.logIn(
          login: event.login,
          password: event.password
      ).then((isAuthorized) => {
        if(isAuthorized == true){
          print('Success'),
          emit(AuthSuccessful())
        }
        else{
          print('Fail'),
          emit(AuthFailed())
        }});
    });

    on<RegistrationEvent>((event, emit) async {
      // TODO: implement event handler
      bool status = await userRep.registration(
          login: event.login,
          password: event.password
      );
        if(status == true){
          print('Success');
          emit(RegistrationSuccessful());
        }else{
          print('Fail');
          emit(RegistrationFailed());
        }
    });

    on<LogOutEvent>((event, emit) {
      // TODO: implement event handler
      userRep.logOut();
      emit(LogOutSuccessful());
    });

    on<TamaEvent>((event, emit){
      if(event.name != null && event.flag_b != (null as bool)){
        print(event.name);
        print(event.flag_b);
        print('Successful tama add');
        emit(TamaAddSuccessful());
      }else{
        emit(TamaAddFailed());
      }
    });
  }
}
