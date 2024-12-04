import 'package:json_annotation/json_annotation.dart';

part 'brand.g.dart';

@JsonSerializable()
class Brand {
  final int? brandId;
  final String? brandName;

  Brand({
    this.brandId,
    this.brandName,
  });

  factory Brand.fromJson(Map<String, dynamic> json) =>
      _$BrandFromJson(json);

  Map<String, dynamic> toJson() => _$BrandToJson(this);
}
