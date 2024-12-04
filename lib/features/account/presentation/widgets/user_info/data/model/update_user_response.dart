import 'package:json_annotation/json_annotation.dart';

part 'update_user_response.g.dart';

@JsonSerializable()
class UpdateUserResponse {
  final bool result;
  final bool isSuccess;
  final String message;

  UpdateUserResponse({
    required this.result,
    required this.isSuccess,
    required this.message,
  });

  factory UpdateUserResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateUserResponseToJson(this);
}
