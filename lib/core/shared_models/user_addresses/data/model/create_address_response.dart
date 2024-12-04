import 'package:json_annotation/json_annotation.dart';

part 'create_address_response.g.dart';

@JsonSerializable()
class CreateAddressResponse {
  final bool result;
  final bool isSuccess;
  final String? message;

  CreateAddressResponse({
    required this.result,
    required this.isSuccess,
    this.message,
  });

  factory CreateAddressResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateAddressResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateAddressResponseToJson(this);
}
