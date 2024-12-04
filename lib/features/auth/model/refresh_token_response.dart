import 'package:json_annotation/json_annotation.dart';

part 'refresh_token_response.g.dart';

@JsonSerializable()
class RefreshTokenResponse {
  final TokenResult? result;
  final bool? isSuccess;
  final String? message;

  RefreshTokenResponse({this.result, this.isSuccess, this.message});

  factory RefreshTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RefreshTokenResponseToJson(this);
}

@JsonSerializable()
class TokenResult {
  final String? accessToken;
  final String? refreshToken;

  TokenResult({this.accessToken, this.refreshToken});

  factory TokenResult.fromJson(Map<String, dynamic> json) =>
      _$TokenResultFromJson(json);

  Map<String, dynamic> toJson() => _$TokenResultToJson(this);
}