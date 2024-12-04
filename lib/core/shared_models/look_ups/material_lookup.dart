import 'package:json_annotation/json_annotation.dart';

part 'material_lookup.g.dart';

@JsonSerializable()
class MaterialLookUp {
  final int value;
  final String nameAr;
  final String nameEn;

  MaterialLookUp({
    required this.value,
    required this.nameAr,
    required this.nameEn,
  });

  factory MaterialLookUp.fromJson(Map<String, dynamic> json) => _$MaterialLookUpFromJson(json);

  Map<String, dynamic> toJson() => _$MaterialLookUpToJson(this);
}
