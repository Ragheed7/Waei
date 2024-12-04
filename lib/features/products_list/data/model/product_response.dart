import 'package:json_annotation/json_annotation.dart';
import 'package:waie/features/products_list/data/model/product_models/product.dart';

part 'product_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductResponse {
  final bool? isSuccess;
  final String? message;
  final List<Product> result;

  ProductResponse({
    this.isSuccess,
    this.message,
    required this.result,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
}
