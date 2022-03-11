import 'package:json_annotation/json_annotation.dart';
part 'registration_data.g.dart';

@JsonSerializable()
class RegistrationData {
  final String name;
  final String password;

  RegistrationData({
    required this.name,
    required this.password,
  });

  factory RegistrationData.fromJson(Map<String, dynamic> json) =>
      _$RegistrationDataFromJson(json);

  @override
  String toString() {
    return 'RegistrationData: {\n name: $name,\n password: $password,\n}';
  }

  Map<String, dynamic> toJson() => _$RegistrationDataToJson(this);
}
