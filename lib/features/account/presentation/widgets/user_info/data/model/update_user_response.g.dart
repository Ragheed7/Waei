// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateUserResponse _$UpdateUserResponseFromJson(Map<String, dynamic> json) =>
    UpdateUserResponse(
      result: json['result'] as bool,
      isSuccess: json['isSuccess'] as bool,
      message: json['message'] as String,
    );

Map<String, dynamic> _$UpdateUserResponseToJson(UpdateUserResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
      'isSuccess': instance.isSuccess,
      'message': instance.message,
    };
