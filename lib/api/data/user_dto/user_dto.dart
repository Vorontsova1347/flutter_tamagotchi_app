import 'package:json_annotation/json_annotation.dart';
import 'package:tamagochi_app/api/data/tamagochi_dto/tamagochi_dto.dart';
part 'user_dto.g.dart';

@JsonSerializable()
class UserDto {
  final int id;
  final String name;
  final List<TamagochiDto?> tamagochi;

  UserDto({
    required this.id,
    required this.name,
    required this.tamagochi,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  @override
  String toString() {
    return 'UserDto: {\n id: $id,\n name: $name,\n tamagochi: ${tamagochi.toString()},\n}';
  }

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}
