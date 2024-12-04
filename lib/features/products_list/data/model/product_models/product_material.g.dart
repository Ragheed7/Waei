// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_material.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductMaterial _$ProductMaterialFromJson(Map<String, dynamic> json) =>
    ProductMaterial(
      materialId: (json['materialId'] as num?)?.toInt(),
      materialNameAr: json['materialNameAr'] as String?,
      materialNameEn: json['materialNameEn'] as String?,
    );

Map<String, dynamic> _$ProductMaterialToJson(ProductMaterial instance) =>
    <String, dynamic>{
      'materialId': instance.materialId,
      'materialNameAr': instance.materialNameAr,
      'materialNameEn': instance.materialNameEn,
    };
