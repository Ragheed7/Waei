// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateAddress _$CreateAddressFromJson(Map<String, dynamic> json) =>
    CreateAddress(
      streetAddress: json['streetAddress'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      zipCode: json['zipCode'] as String,
      country: json['country'] as String,
    );

Map<String, dynamic> _$CreateAddressToJson(CreateAddress instance) =>
    <String, dynamic>{
      'streetAddress': instance.streetAddress,
      'city': instance.city,
      'state': instance.state,
      'zipCode': instance.zipCode,
      'country': instance.country,
    };
