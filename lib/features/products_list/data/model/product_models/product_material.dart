import 'package:json_annotation/json_annotation.dart';

part 'product_material.g.dart';

@JsonSerializable()
class ProductMaterial {
  final int? materialId;
  final String? materialNameAr;
  final String? materialNameEn;

  ProductMaterial({
    this.materialId,
    this.materialNameAr,
    this.materialNameEn,
  });

  factory ProductMaterial.fromJson(Map<String, dynamic> json) =>
      _$ProductMaterialFromJson(json);

  Map<String, dynamic> toJson() => _$ProductMaterialToJson(this);
}
