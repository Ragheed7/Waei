import 'package:json_annotation/json_annotation.dart';
import 'package:waie/features/cart/data/model/order_models/sub_order_models/order.dart';

part 'pay_order_response.g.dart';

@JsonSerializable(explicitToJson: true)
class PayOrderResponse {
  final Order result;
  final bool isSuccess;
  final String? message;

  PayOrderResponse({
    required this.result,
    required this.isSuccess,
    this.message,
  });

  factory PayOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$PayOrderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PayOrderResponseToJson(this);
}
