// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
      transactionDate: DateTime.parse(json['transactionDate'] as String),
      totalPrice: (json['totalPrice'] as num).toDouble(),
      transactionStatus: (json['transactionStatus'] as num).toInt(),
      provider: (json['provider'] as num).toInt(),
      cardholderName: json['cardholderName'] as String,
    );

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'transactionDate': instance.transactionDate.toIso8601String(),
      'totalPrice': instance.totalPrice,
      'transactionStatus': instance.transactionStatus,
      'provider': instance.provider,
      'cardholderName': instance.cardholderName,
    };
