import 'package:json_annotation/json_annotation.dart';
import 'package:tamagochi_app/api/data/tamagochi_dto/tamagochi_dto.dart';
part 'user_dto.g.dart';

@JsonSerializable()
class UserDto {
  final int? id;
  final String? login;
  final TamagochiDto? tamagochi;

  UserDto({
    required this.id,
    required this.login,
    required this.tamagochi,
  });

  factory UserDto.empty() => UserDto(
        id: null,
        login: null,
        tamagochi: TamagochiDto.empty(),
      );

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  @override
  String toString() {
    return 'UserDto: {\n id: $id,\n login: $login,\n tamagochi: $tamagochi,\n}';
  }

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}
