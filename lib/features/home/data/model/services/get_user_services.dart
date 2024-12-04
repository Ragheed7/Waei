import 'package:json_annotation/json_annotation.dart';
import 'package:waie/features/products_list/data/model/product_models/image_data.dart';

part 'get_user_services.g.dart';

@JsonSerializable()
class GetUserServices {
  final bool isSuccess;
  final String? message;
  final List<ServiceRequest> result;

  GetUserServices({
    required this.isSuccess,
    this.message,
    required this.result,
  });

  factory GetUserServices.fromJson(Map<String, dynamic> json) =>
      _$GetUserServicesFromJson(json);

  Map<String, dynamic> toJson() => _$GetUserServicesToJson(this);
}

@JsonSerializable()
class ServiceRequest {
  final int requestId;
  final String userPhone;
  final int requestType;
  final String productDetails;
  final double requestedPrice;
  final double purchasePrice;
  final int serviceRequestStatus;
  final String submissionDate;
  final String? responseDate;
  final String? responseDetails;
  final List<ImageData> images;

  ServiceRequest({
    required this.requestId,
    required this.userPhone,
    required this.requestType,
    required this.productDetails,
    required this.requestedPrice,
    required this.purchasePrice,
    required this.serviceRequestStatus,
    required this.submissionDate,
    this.responseDate,
    this.responseDetails,
    required this.images,
  });

  factory ServiceRequest.fromJson(Map<String, dynamic> json) =>
      _$ServiceRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceRequestToJson(this);
}


