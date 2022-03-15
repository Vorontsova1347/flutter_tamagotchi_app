import 'package:tamagochi_app/features/common/domain/entities/tamagochi.dart';

/// Сущность пользователя
class User {
  final int id;
  final String login;
  final Tamagochi tamagochi;

  User({
    required this.id,
    required this.login,
    required this.tamagochi,
  });

  @override
  String toString() {
    return 'User: {\n id: $id,\n login: $login,\n tamagochi: ${tamagochi.toString()},\n}';
  }
}
