import 'package:json_annotation/json_annotation.dart';
import 'package:waie/features/products_list/data/model/product_models/product.dart';

part 'order_item.g.dart';

@JsonSerializable()
class OrderItem {
  final Product product;

  OrderItem({
    required this.product,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemToJson(this);
}