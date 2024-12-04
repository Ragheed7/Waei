import 'package:json_annotation/json_annotation.dart';

part 'transaction.g.dart';

@JsonSerializable()
class Transaction {
  final DateTime transactionDate;
  final double totalPrice;
  final int transactionStatus;
  final int provider;
  final String cardholderName;

  Transaction({
    required this.transactionDate,
    required this.totalPrice,
    required this.transactionStatus,
    required this.provider,
    required this.cardholderName,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}