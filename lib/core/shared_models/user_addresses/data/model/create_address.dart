import 'package:json_annotation/json_annotation.dart';

part 'create_address.g.dart';

@JsonSerializable()
class CreateAddress {
  final String streetAddress;
  final String city;
  final String state;
  final String zipCode;
  final String country;

  CreateAddress({
    required this.streetAddress,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.country,
  });

  factory CreateAddress.fromJson(Map<String, dynamic> json) =>
      _$CreateAddressFromJson(json);

  Map<String, dynamic> toJson() => _$CreateAddressToJson(this);
}
