// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_addresses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      addressId: (json['addressId'] as num).toInt(),
      streetAddress: json['streetAddress'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      zipCode: json['zipCode'] as String,
      country: json['country'] as String,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'addressId': instance.addressId,
      'streetAddress': instance.streetAddress,
      'city': instance.city,
      'state': instance.state,
      'zipCode': instance.zipCode,
      'country': instance.country,
    };

GetAddresses _$GetAddressesFromJson(Map<String, dynamic> json) => GetAddresses(
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => Address.fromJson(e as Map<String, dynamic>))
          .toList(),
      isSuccess: json['isSuccess'] as bool,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$GetAddressesToJson(GetAddresses instance) =>
    <String, dynamic>{
      'result': instance.result,
      'isSuccess': instance.isSuccess,
      'message': instance.message,
    };
