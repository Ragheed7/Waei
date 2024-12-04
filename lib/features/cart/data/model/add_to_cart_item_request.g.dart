// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_to_cart_item_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddToCartItemRequest _$AddToCartItemRequestFromJson(
        Map<String, dynamic> json) =>
    AddToCartItemRequest(
      productId: (json['productId'] as num).toInt(),
    );

Map<String, dynamic> _$AddToCartItemRequestToJson(
        AddToCartItemRequest instance) =>
    <String, dynamic>{
      'productId': instance.productId,
    };
