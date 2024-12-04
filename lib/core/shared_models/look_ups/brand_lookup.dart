import 'package:json_annotation/json_annotation.dart';

part 'brand_lookup.g.dart';

@JsonSerializable()
class BrandLookUp {
  final int value;
  final String nameAr;
  final String nameEn;

  BrandLookUp({
    required this.value,
    required this.nameAr,
    required this.nameEn,
  });

  factory BrandLookUp.fromJson(Map<String, dynamic> json) => _$BrandLookUpFromJson(json);

  Map<String, dynamic> toJson() => _$BrandLookUpToJson(this);
}
