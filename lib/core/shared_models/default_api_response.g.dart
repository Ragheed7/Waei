// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'default_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DefaultApiResponse _$DefaultApiResponseFromJson(Map<String, dynamic> json) =>
    DefaultApiResponse(
      result: json['result'] as bool,
      isSuccess: json['isSuccess'] as bool,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$DefaultApiResponseToJson(DefaultApiResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
      'isSuccess': instance.isSuccess,
      'message': instance.message,
    };
