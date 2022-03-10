import 'package:json_annotation/json_annotation.dart';
part 'user_dump.g.dart';

@JsonSerializable()
class UserDump {
  final int? id;
  final String? name;

  UserDump(
    this.id,
    this.name,
  );

  factory UserDump.fromJson(Map<String, dynamic> json) =>
      _$UserDumpFromJson(json);

  Map<String, dynamic> toJson() => _$UserDumpToJson(this);
}
