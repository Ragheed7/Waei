import 'package:json_annotation/json_annotation.dart';
import 'package:waie/features/products_list/data/model/product_models/product.dart';
import 'package:waie/features/products_list/data/model/product_response.dart';

part 'get_cart_items.g.dart';

@JsonSerializable(explicitToJson: true)
class GetCartItems {
  final List<Product>? result;
  final bool? isSuccess;
  final String? message;

  GetCartItems({
    this.result,
    this.isSuccess,
    this.message,
  });

  factory GetCartItems.fromJson(Map<String, dynamic> json) =>
      _$GetCartItemsFromJson(json);

  Map<String, dynamic> toJson() => _$GetCartItemsToJson(this);
}
