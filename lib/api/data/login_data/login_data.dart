import 'package:json_annotation/json_annotation.dart';
part 'login_data.g.dart';

@JsonSerializable()
class LoginData {
  final String name;
  final String password;

  LoginData({
    required this.name,
    required this.password,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);

  @override
  String toString() {
    return 'LoginData: {\n name: $name,\n password: $password,\n}';
  }

  Map<String, dynamic> toJson() => _$LoginDataToJson(this);
}
