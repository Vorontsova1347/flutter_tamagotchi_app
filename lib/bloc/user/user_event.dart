part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class AuthorizationEvent extends UserEvent {
  final String login;
  final String password;

  AuthorizationEvent({required this.login, required this.password});
}

class RegistrationEvent extends UserEvent {
  final String login;
  final String password;

  RegistrationEvent({required this.login, required this.password});
}

class LogOutEvent extends UserEvent{

}