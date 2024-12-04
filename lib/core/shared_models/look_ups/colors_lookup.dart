import 'package:json_annotation/json_annotation.dart';

part 'colors_lookup.g.dart';

@JsonSerializable()
class ColorsLookUp {
  final int value;
  final String nameAr;
  final String nameEn;

  ColorsLookUp({
    required this.value,
    required this.nameAr,
    required this.nameEn,
  });

  factory ColorsLookUp.fromJson(Map<String, dynamic> json) => _$ColorsLookUpFromJson(json);

  Map<String, dynamic> toJson() => _$ColorsLookUpToJson(this);
}
