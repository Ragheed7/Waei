// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_address_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateAddressResponse _$CreateAddressResponseFromJson(
        Map<String, dynamic> json) =>
    CreateAddressResponse(
      result: json['result'] as bool,
      isSuccess: json['isSuccess'] as bool,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$CreateAddressResponseToJson(
        CreateAddressResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
      'isSuccess': instance.isSuccess,
      'message': instance.message,
    };
