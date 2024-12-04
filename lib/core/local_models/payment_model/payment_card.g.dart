// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentCard _$PaymentCardFromJson(Map<String, dynamic> json) => PaymentCard(
      cardNumber: json['cardNumber'] as String,
      cardHolderName: json['cardHolderName'] as String,
      expiryMonth: (json['expiryMonth'] as num).toInt(),
      expiryYear: (json['expiryYear'] as num).toInt(),
    );

Map<String, dynamic> _$PaymentCardToJson(PaymentCard instance) =>
    <String, dynamic>{
      'cardNumber': instance.cardNumber,
      'cardHolderName': instance.cardHolderName,
      'expiryMonth': instance.expiryMonth,
      'expiryYear': instance.expiryYear,
    };
