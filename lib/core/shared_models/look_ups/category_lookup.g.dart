// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_lookup.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryLookUp _$CategoryLookUpFromJson(Map<String, dynamic> json) =>
    CategoryLookUp(
      value: (json['value'] as num).toInt(),
      nameAr: json['nameAr'] as String,
      nameEn: json['nameEn'] as String,
    );

Map<String, dynamic> _$CategoryLookUpToJson(CategoryLookUp instance) =>
    <String, dynamic>{
      'value': instance.value,
      'nameAr': instance.nameAr,
      'nameEn': instance.nameEn,
    };
