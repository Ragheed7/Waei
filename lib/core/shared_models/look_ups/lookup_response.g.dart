// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lookup_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LookupResponse<T> _$LookupResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    LookupResponse<T>(
      result: (json['result'] as List<dynamic>).map(fromJsonT).toList(),
      isSuccess: json['isSuccess'] as bool,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$LookupResponseToJson<T>(
  LookupResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'result': instance.result.map(toJsonT).toList(),
      'isSuccess': instance.isSuccess,
      'message': instance.message,
    };
