import 'dart:async';
import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<AuthorizationEvent>((event, emit) {
      // TODO: implement event handler
      print('Success');
      if (event.login == 'admin' && event.password == '123456789') {
        print(event.login);
        print(event.password);
        emit(AuthSuccessful());
      } else {
        emit(AuthFailed());
      }
    });

    on<RegistrationEvent>((event, emit) {
      // TODO: implement event handler
      if (event.login != 'admin' && event.password != '123456789'){
        print(event.login);
        print(event.password);
        print('Success registration');
        emit(RegistrationSuccessful());
      }else{
        emit(RegistrationFailed());
      }

    });

    on<LogOutEvent>((event, emit) {
      // TODO: implement event handler
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
