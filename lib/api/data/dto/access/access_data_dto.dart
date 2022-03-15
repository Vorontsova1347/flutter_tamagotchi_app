// ignore_for_file: avoid_init_to_null, non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'access_data_dto.g.dart';

/// DTO данных для доступа
@JsonSerializable()
class AccessDataDto {
  String? access_token;
  int? id;

  AccessDataDto({
    this.access_token = null,
    this.id = null,
  });
  factory AccessDataDto.fromJson(Map<String, dynamic> json) =>
      _$AccessDataDtoFromJson(json);

  @override
  String toString() {
    return 'AccessToken: {\n access_token: $access_token,\n id: $id,\n}';
  }

  Map<String, dynamic> toJson() => _$AccessDataDtoToJson(this);
}
