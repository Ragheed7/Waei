import 'package:json_annotation/json_annotation.dart';
import 'package:waie/features/cart/data/model/order_models/sub_order_models/order_item.dart';
import 'package:waie/features/cart/data/model/order_models/sub_order_models/shipping_address.dart';
import 'package:waie/features/cart/data/model/order_models/sub_order_models/transaction.dart';

part 'order.g.dart';

@JsonSerializable()
class Order {
  final int orderId;
  final DateTime createdAt;
  final int status;
  final int shippingAddressId;
  final ShippingAddress shippingAddress;
  final Transaction? transaction;
  final int shippingStatus;
  final DateTime? shippingDate;
  final double totalPrice;
  final List<OrderItem> orderItems;

  Order({
    required this.orderId,
    required this.createdAt,
    required this.status,
    required this.shippingAddressId,
    required this.shippingAddress,
    this.transaction,
    required this.shippingStatus,
    this.shippingDate,
    required this.totalPrice,
    required this.orderItems,
  });

  factory Order.fromJson(Map<String, dynamic> json) =>
      _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}