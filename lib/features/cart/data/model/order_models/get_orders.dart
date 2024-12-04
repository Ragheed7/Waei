import 'package:json_annotation/json_annotation.dart';
import 'package:waie/features/cart/data/model/order_models/sub_order_models/order.dart';

part 'get_orders.g.dart';

@JsonSerializable(explicitToJson: true)
class GetOrders {
  final List<Order> result;
  final bool isSuccess;
  final String? message;

  GetOrders({
    required this.result,
    required this.isSuccess,
    this.message,
  });

  factory GetOrders.fromJson(Map<String, dynamic> json) =>
      _$GetOrdersFromJson(json);

  Map<String, dynamic> toJson() => _$GetOrdersToJson(this);
}







