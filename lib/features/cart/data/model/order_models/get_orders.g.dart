// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_orders.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetOrders _$GetOrdersFromJson(Map<String, dynamic> json) => GetOrders(
      result: (json['result'] as List<dynamic>)
          .map((e) => Order.fromJson(e as Map<String, dynamic>))
          .toList(),
      isSuccess: json['isSuccess'] as bool,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$GetOrdersToJson(GetOrders instance) => <String, dynamic>{
      'result': instance.result.map((e) => e.toJson()).toList(),
      'isSuccess': instance.isSuccess,
      'message': instance.message,
    };
