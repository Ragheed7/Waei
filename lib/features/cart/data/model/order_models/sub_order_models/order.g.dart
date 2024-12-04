// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      orderId: (json['orderId'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      status: (json['status'] as num).toInt(),
      shippingAddressId: (json['shippingAddressId'] as num).toInt(),
      shippingAddress: ShippingAddress.fromJson(
          json['shippingAddress'] as Map<String, dynamic>),
      transaction: json['transaction'] == null
          ? null
          : Transaction.fromJson(json['transaction'] as Map<String, dynamic>),
      shippingStatus: (json['shippingStatus'] as num).toInt(),
      shippingDate: json['shippingDate'] == null
          ? null
          : DateTime.parse(json['shippingDate'] as String),
      totalPrice: (json['totalPrice'] as num).toDouble(),
      orderItems: (json['orderItems'] as List<dynamic>)
          .map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'orderId': instance.orderId,
      'createdAt': instance.createdAt.toIso8601String(),
      'status': instance.status,
      'shippingAddressId': instance.shippingAddressId,
      'shippingAddress': instance.shippingAddress,
      'transaction': instance.transaction,
      'shippingStatus': instance.shippingStatus,
      'shippingDate': instance.shippingDate?.toIso8601String(),
      'totalPrice': instance.totalPrice,
      'orderItems': instance.orderItems,
    };
