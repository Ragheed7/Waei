// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateAddress _$UpdateAddressFromJson(Map<String, dynamic> json) =>
    UpdateAddress(
      addressId: (json['addressId'] as num).toInt(),
      streetAddress: json['streetAddress'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      zipCode: json['zipCode'] as String,
      country: json['country'] as String,
    );

Map<String, dynamic> _$UpdateAddressToJson(UpdateAddress instance) =>
    <String, dynamic>{
      'addressId': instance.addressId,
      'streetAddress': instance.streetAddress,
      'city': instance.city,
      'state': instance.state,
      'zipCode': instance.zipCode,
      'country': instance.country,
    };
