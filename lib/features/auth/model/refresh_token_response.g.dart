// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_token_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RefreshTokenResponse _$RefreshTokenResponseFromJson(
        Map<String, dynamic> json) =>
    RefreshTokenResponse(
      result: json['result'] == null
          ? null
          : TokenResult.fromJson(json['result'] as Map<String, dynamic>),
      isSuccess: json['isSuccess'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$RefreshTokenResponseToJson(
        RefreshTokenResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
      'isSuccess': instance.isSuccess,
      'message': instance.message,
    };

TokenResult _$TokenResultFromJson(Map<String, dynamic> json) => TokenResult(
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
    );

Map<String, dynamic> _$TokenResultToJson(TokenResult instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
