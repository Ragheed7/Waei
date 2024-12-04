// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'style.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Style _$StyleFromJson(Map<String, dynamic> json) => Style(
      styleId: (json['styleId'] as num?)?.toInt(),
      styleNameAr: json['styleNameAr'] as String?,
      styleNameEn: json['styleNameEn'] as String?,
    );

Map<String, dynamic> _$StyleToJson(Style instance) => <String, dynamic>{
      'styleId': instance.styleId,
      'styleNameAr': instance.styleNameAr,
      'styleNameEn': instance.styleNameEn,
    };
