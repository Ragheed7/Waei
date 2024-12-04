import 'package:json_annotation/json_annotation.dart';

part 'shipping_address.g.dart';

@JsonSerializable()
class ShippingAddress {
  final int addressId;
  final String streetAddress;
  final String city;
  final String state;
  final String zipCode;
  final String country;

  ShippingAddress({
    required this.addressId,
    required this.streetAddress,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.country,
  });

  factory ShippingAddress.fromJson(Map<String, dynamic> json) =>
      _$ShippingAddressFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingAddressToJson(this);
}