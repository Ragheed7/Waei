import 'package:json_annotation/json_annotation.dart';

part 'category_lookup.g.dart';

@JsonSerializable()
class CategoryLookUp {
  final int value;
  final String nameAr;
  final String nameEn;

  CategoryLookUp({
    required this.value,
    required this.nameAr,
    required this.nameEn,
  });

  factory CategoryLookUp.fromJson(Map<String, dynamic> json) => _$CategoryLookUpFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryLookUpToJson(this);
}
