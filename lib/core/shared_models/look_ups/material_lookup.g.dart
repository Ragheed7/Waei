// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_lookup.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaterialLookUp _$MaterialLookUpFromJson(Map<String, dynamic> json) =>
    MaterialLookUp(
      value: (json['value'] as num).toInt(),
      nameAr: json['nameAr'] as String,
      nameEn: json['nameEn'] as String,
    );

Map<String, dynamic> _$MaterialLookUpToJson(MaterialLookUp instance) =>
    <String, dynamic>{
      'value': instance.value,
      'nameAr': instance.nameAr,
      'nameEn': instance.nameEn,
    };
