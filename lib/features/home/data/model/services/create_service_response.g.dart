// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_service_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateServiceResponse _$CreateServiceResponseFromJson(
        Map<String, dynamic> json) =>
    CreateServiceResponse(
      result: json['result'] as bool,
      isSuccess: json['isSuccess'] as bool,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$CreateServiceResponseToJson(
        CreateServiceResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
      'isSuccess': instance.isSuccess,
      'message': instance.message,
    };
