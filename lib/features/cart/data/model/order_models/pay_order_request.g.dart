// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pay_order_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayOrderRequest _$PayOrderRequestFromJson(Map<String, dynamic> json) =>
    PayOrderRequest(
      creditCardNumber: json['CreditCardNumber'] as String,
      cardholderName: json['CardholderName'] as String,
      expirationDate: json['ExpirationDate'] as String,
      cvv: json['Cvv'] as String,
    );

Map<String, dynamic> _$PayOrderRequestToJson(PayOrderRequest instance) =>
    <String, dynamic>{
      'CreditCardNumber': instance.creditCardNumber,
      'CardholderName': instance.cardholderName,
      'ExpirationDate': instance.expirationDate,
      'Cvv': instance.cvv,
    };
