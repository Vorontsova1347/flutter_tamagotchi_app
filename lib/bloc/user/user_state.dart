part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class AuthSuccessful extends UserInitial {

}

class AuthFailed extends UserInitial {

}

class RegistrationSuccessful extends UserInitial {

}

class RegistrationFailed extends UserInitial {

}

class LogOutSuccessful extends UserInitial {

}

class TamaAddSuccessful extends UserInitial{

}

class TamaAddFailed extends UserInitial{

}