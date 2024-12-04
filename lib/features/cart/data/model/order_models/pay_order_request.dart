import 'package:json_annotation/json_annotation.dart';

part 'pay_order_request.g.dart';

@JsonSerializable()
class PayOrderRequest {
@JsonKey(name: 'CreditCardNumber')
  final String creditCardNumber;

  @JsonKey(name: 'CardholderName')
  final String cardholderName;

  @JsonKey(name: 'ExpirationDate')
  final String expirationDate;

  @JsonKey(name: 'Cvv')
  final String cvv;

  PayOrderRequest({
    required this.creditCardNumber,
    required this.cardholderName,
    required this.expirationDate,
    required this.cvv,
  });

  factory PayOrderRequest.fromJson(Map<String, dynamic> json) =>
      _$PayOrderRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PayOrderRequestToJson(this);
}
