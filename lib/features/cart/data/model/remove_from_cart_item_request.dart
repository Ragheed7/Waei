import 'package:json_annotation/json_annotation.dart';

part 'remove_from_cart_item_request.g.dart';

@JsonSerializable()
class RemoveFromCartItemRequest {
  final int productId;

  RemoveFromCartItemRequest({required this.productId});

  factory RemoveFromCartItemRequest.fromJson(Map<String, dynamic> json) =>
      _$RemoveFromCartItemRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RemoveFromCartItemRequestToJson(this);
}
