import 'package:json_annotation/json_annotation.dart';

part 'update_user_request.g.dart';

@JsonSerializable()
class UpdateUserRequest {
  final String userName;
  final String email;

  UpdateUserRequest({
    required this.userName,
    required this.email,
  });

  factory UpdateUserRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserRequestFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateUserRequestToJson(this);
}
