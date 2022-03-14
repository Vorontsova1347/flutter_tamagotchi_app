// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'password_data.g.dart';

@JsonSerializable()
class PasswordData {
  final String new_password;
  final String old_password;

  PasswordData({
    required this.new_password,
    required this.old_password,
  });

  
  factory PasswordData.fromJson(Map<String, dynamic> json) =>
      _$PasswordDataFromJson(json);

  @override
  String toString() {
    return 'PasswordData: {\n old_password: $old_password,\n new_password: $new_password,\n}';
  }

  Map<String, dynamic> toJson() => _$PasswordDataToJson(this);
}
