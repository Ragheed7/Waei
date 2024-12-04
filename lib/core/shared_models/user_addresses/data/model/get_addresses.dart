import 'package:json_annotation/json_annotation.dart';

part 'get_addresses.g.dart';

@JsonSerializable()
class Address {
  final int addressId;
  final String streetAddress;
  final String city;
  final String state;
  final String zipCode;
  final String country;

  Address({
    required this.addressId,
    required this.streetAddress,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.country,
  });

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}

@JsonSerializable()
class GetAddresses {
  final List<Address>? result;
  final bool isSuccess;
  final String? message;

  GetAddresses({
    required this.result,
    required this.isSuccess,
    this.message,
  });

  factory GetAddresses.fromJson(Map<String, dynamic> json) =>
      _$GetAddressesFromJson(json);

  Map<String, dynamic> toJson() => _$GetAddressesToJson(this);
}
