import 'package:json_annotation/json_annotation.dart';

part 'style.g.dart';

@JsonSerializable()
class Style {
  final int? styleId;
  final String? styleNameAr;
  final String? styleNameEn;

  Style({
    this.styleId,
    this.styleNameAr,
    this.styleNameEn,
  });

  factory Style.fromJson(Map<String, dynamic> json) =>
      _$StyleFromJson(json);

  Map<String, dynamic> toJson() => _$StyleToJson(this);
}
