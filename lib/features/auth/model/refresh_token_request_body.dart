import 'package:json_annotation/json_annotation.dart';

part 'refresh_token_request_body.g.dart';

@JsonSerializable()
class RefreshTokenRequestBody {
  final String accessToken;
  final String refreshToken;

  RefreshTokenRequestBody({
    required this.accessToken,
    required this.refreshToken,
  });

  factory RefreshTokenRequestBody.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$RefreshTokenRequestBodyToJson(this);
}