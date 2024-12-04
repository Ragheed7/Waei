// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_cart_items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCartItems _$GetCartItemsFromJson(Map<String, dynamic> json) => GetCartItems(
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      isSuccess: json['isSuccess'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$GetCartItemsToJson(GetCartItems instance) =>
    <String, dynamic>{
      'result': instance.result?.map((e) => e.toJson()).toList(),
      'isSuccess': instance.isSuccess,
      'message': instance.message,
    };
