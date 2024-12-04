import 'package:json_annotation/json_annotation.dart';

part 'payment_card.g.dart';

@JsonSerializable()
class PaymentCard {
  String cardNumber;
  String cardHolderName;
  int expiryMonth;
  int expiryYear;

  PaymentCard({
    required this.cardNumber,
    required this.cardHolderName,
    required this.expiryMonth,
    required this.expiryYear,
  });

  factory PaymentCard.fromJson(Map<String, dynamic> json) =>
      _$PaymentCardFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentCardToJson(this);

  /// Returns the masked card number, showing only the last 4 digits.
  String get maskedCardNumber {
    if (cardNumber.length < 4) return cardNumber;
    final last4 = cardNumber.substring(cardNumber.length - 4);
    return '**** **** **** $last4';
  }
}