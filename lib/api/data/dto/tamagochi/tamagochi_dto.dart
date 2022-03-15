// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'tamagochi_dto.g.dart';

/// DTO тамагочи
@JsonSerializable()
class TamagochiDto {
  final double? sleep;
  final double? health;
  final double? game;
  final double? food;
  final String? name;
  final String? gender;
  final int? user_id;
  final int? id;
  final double? general_state;

  TamagochiDto({
    required this.sleep,
    required this.health,
    required this.game,
    required this.food,
    required this.gender,
    required this.name,
    required this.user_id,
    required this.id,
    required this.general_state,
  });

  factory TamagochiDto.empty() => TamagochiDto(
        sleep: null,
        health: null,
        game: null,
        food: null,
        gender: null,
        name: null,
        user_id: null,
        id: null,
        general_state: null,
      );

  factory TamagochiDto.fromJson(Map<String, dynamic> json) =>
      _$TamagochiDtoFromJson(json);

  @override
  String toString() {
    return 'TamagochiDto: {\n sleep: $sleep,\n health: $health,\n game: $game,\n food: $food,\n sleep: $sleep,,\n name: $name,\n gender: $gender\n user_id: $user_id,\n id: $id,\n general_state: $general_state,\n}';
  }

  Map<String, dynamic> toJson() => _$TamagochiDtoToJson(this);
}
