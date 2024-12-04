import 'package:json_annotation/json_annotation.dart';

part 'create_service_request.g.dart';

@JsonSerializable()
class CreateServiceRequest {
  final int requestType;
  final String productDetails;
  final double requestedPrice;
  final double purchasePrice;
  final List<String> imagesString64;

  CreateServiceRequest({
    required this.requestType,
    required this.productDetails,
    required this.requestedPrice,
    required this.purchasePrice,
    required this.imagesString64,
  });

  factory CreateServiceRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateServiceRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateServiceRequestToJson(this);
}