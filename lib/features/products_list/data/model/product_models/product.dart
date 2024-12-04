import 'package:json_annotation/json_annotation.dart';
import 'package:waie/core/shared_models/category_data_model/category_data.dart';
import 'product_material.dart';
import 'style.dart';
import 'brand.dart';
import 'image_data.dart';

part 'product.g.dart';

@JsonSerializable(explicitToJson: true)
class Product {
  final int productId;
  final CategoryData? category;
  final String nameAr;
  final String nameEn;
  final String? descriptionAr;  
  final String? descriptionEn;
  final ProductMaterial? material;
  final Style? style;
  final int? color;
  final double? height;
  final double? width;
  final double? weight;
  final double? price;
  final Brand? brand;
  final List<ImageData>? images;
  final int? productStatus;

  Product({
    required this.productId,
    this.category,
    required this.nameAr,
    required this.nameEn,
    this.descriptionAr,
    this.descriptionEn,
    this.material,
    this.style,
    this.color,
    this.height,
    this.width,
    this.weight,
    this.price,
    this.brand,
    this.images,
    this.productStatus,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
