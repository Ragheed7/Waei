import 'package:json_annotation/json_annotation.dart';
import 'package:waie/features/cart/data/model/order_models/sub_order_models/order.dart';

part 'create_order_response.g.dart';

@JsonSerializable(explicitToJson: true)
class CreateOrderResponse {
  final Order result;
  final bool isSuccess;
  final String? message;

  CreateOrderResponse({
    required this.result,
    required this.isSuccess,
    this.message,
  });

  factory CreateOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateOrderResponseToJson(this);
}
