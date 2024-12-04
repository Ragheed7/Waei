import 'package:json_annotation/json_annotation.dart';

part 'style_lookup.g.dart';

@JsonSerializable()
class StyleLookUp {
  final int value;
  final String nameAr;
  final String nameEn;

  StyleLookUp({
    required this.value,
    required this.nameAr,
    required this.nameEn,
  });

  factory StyleLookUp.fromJson(Map<String, dynamic> json) => _$StyleLookUpFromJson(json);

  Map<String, dynamic> toJson() => _$StyleLookUpToJson(this);
}
