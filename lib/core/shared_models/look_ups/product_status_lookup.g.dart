// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_status_lookup.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductStatusLookUp _$ProductStatusLookUpFromJson(Map<String, dynamic> json) =>
    ProductStatusLookUp(
      value: (json['value'] as num).toInt(),
      nameAr: json['nameAr'] as String,
      nameEn: json['nameEn'] as String,
    );

Map<String, dynamic> _$ProductStatusLookUpToJson(
        ProductStatusLookUp instance) =>
    <String, dynamic>{
      'value': instance.value,
      'nameAr': instance.nameAr,
      'nameEn': instance.nameEn,
    };
