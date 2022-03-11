// ignore_for_file: avoid_init_to_null, non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'access_data.g.dart';

@JsonSerializable()
class AccessData {
  String? access_token;
  int? id;

  AccessData({
    this.access_token = null,
    this.id = null,
  });
  factory AccessData.fromJson(Map<String, dynamic> json) =>
      _$AccessDataFromJson(json);

  @override
  String toString() {
    return 'AccessToken: {\n access_token: $access_token,\n id: $id,\n}';
  }

  Map<String, dynamic> toJson() => _$AccessDataToJson(this);
}
