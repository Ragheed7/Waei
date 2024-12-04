// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand_lookup.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrandLookUp _$BrandLookUpFromJson(Map<String, dynamic> json) => BrandLookUp(
      value: (json['value'] as num).toInt(),
      nameAr: json['nameAr'] as String,
      nameEn: json['nameEn'] as String,
    );

Map<String, dynamic> _$BrandLookUpToJson(BrandLookUp instance) =>
    <String, dynamic>{
      'value': instance.value,
      'nameAr': instance.nameAr,
      'nameEn': instance.nameEn,
    };
