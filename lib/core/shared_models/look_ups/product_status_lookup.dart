import 'package:json_annotation/json_annotation.dart';

part 'product_status_lookup.g.dart';

@JsonSerializable()
class ProductStatusLookUp {
  final int value;
  final String nameAr;
  final String nameEn;

  ProductStatusLookUp({
    required this.value,
    required this.nameAr,
    required this.nameEn,
  });

  factory ProductStatusLookUp.fromJson(Map<String, dynamic> json) => _$ProductStatusLookUpFromJson(json);

  Map<String, dynamic> toJson() => _$ProductStatusLookUpToJson(this);
}
