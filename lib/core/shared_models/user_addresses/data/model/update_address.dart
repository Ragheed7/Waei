import 'package:json_annotation/json_annotation.dart';

part 'update_address.g.dart';

@JsonSerializable()
class UpdateAddress {
  final int addressId;
  final String streetAddress;
  final String city;
  final String state;
  final String zipCode;
  final String country;

  UpdateAddress({
    required this.addressId,
    required this.streetAddress,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.country,
  });

  factory UpdateAddress.fromJson(Map<String, dynamic> json) =>
      _$UpdateAddressFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateAddressToJson(this);
}
