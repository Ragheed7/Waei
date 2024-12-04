// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pay_order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayOrderResponse _$PayOrderResponseFromJson(Map<String, dynamic> json) =>
    PayOrderResponse(
      result: Order.fromJson(json['result'] as Map<String, dynamic>),
      isSuccess: json['isSuccess'] as bool,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$PayOrderResponseToJson(PayOrderResponse instance) =>
    <String, dynamic>{
      'result': instance.result.toJson(),
      'isSuccess': instance.isSuccess,
      'message': instance.message,
    };
