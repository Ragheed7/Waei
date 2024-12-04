import 'package:json_annotation/json_annotation.dart';
part 'add_to_cart_item_request.g.dart';

@JsonSerializable()
class AddToCartItemRequest {
  final int productId;

  AddToCartItemRequest({required this.productId});

  factory AddToCartItemRequest.fromJson(Map<String, dynamic> json) =>
      _$AddToCartItemRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddToCartItemRequestToJson(this);
}
