import 'package:flutter_app/model/tamagotchi.dart';

class User{
  int id;
  String login;

  Tama tamagotchi;

  User({
    required this.id,
    required this.login,
    required this.tamagotchi
  });

  static fromJson({json}) {
    Iterable l = json['posts'];
    User u = User(
        id: json['id'],
        login: json['name'],
        tamagotchi: Tama.fromJson(json: json['tamagotchi'] [0])
    );

    return u;
  }
}