// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_token_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RefreshTokenRequestBody _$RefreshTokenRequestBodyFromJson(
        Map<String, dynamic> json) =>
    RefreshTokenRequestBody(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$RefreshTokenRequestBodyToJson(
        RefreshTokenRequestBody instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
