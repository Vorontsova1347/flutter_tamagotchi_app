// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'password_update_data.g.dart';

/// Модель даннных для обновления пароля
@JsonSerializable()
class PasswordUpdateData {
  final String new_password;
  final String old_password;

  PasswordUpdateData({
    required this.new_password,
    required this.old_password,
  });

  factory PasswordUpdateData.fromJson(Map<String, dynamic> json) =>
      _$PasswordUpdateDataFromJson(json);

  @override
  String toString() {
    return 'PasswordUpdateData: {\n old_password: $old_password,\n new_password: $new_password,\n}';
  }

  Map<String, dynamic> toJson() => _$PasswordUpdateDataToJson(this);
}
