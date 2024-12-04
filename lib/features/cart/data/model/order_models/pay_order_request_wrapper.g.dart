// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pay_order_request_wrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayOrderRequestWrapper _$PayOrderRequestWrapperFromJson(
        Map<String, dynamic> json) =>
    PayOrderRequestWrapper(
      payOrderDto:
          PayOrderRequest.fromJson(json['payOrderDto'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PayOrderRequestWrapperToJson(
        PayOrderRequestWrapper instance) =>
    <String, dynamic>{
      'payOrderDto': instance.payOrderDto.toJson(),
    };
