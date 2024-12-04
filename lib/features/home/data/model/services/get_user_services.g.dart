// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_services.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserServices _$GetUserServicesFromJson(Map<String, dynamic> json) =>
    GetUserServices(
      isSuccess: json['isSuccess'] as bool,
      message: json['message'] as String?,
      result: (json['result'] as List<dynamic>)
          .map((e) => ServiceRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetUserServicesToJson(GetUserServices instance) =>
    <String, dynamic>{
      'isSuccess': instance.isSuccess,
      'message': instance.message,
      'result': instance.result,
    };

ServiceRequest _$ServiceRequestFromJson(Map<String, dynamic> json) =>
    ServiceRequest(
      requestId: (json['requestId'] as num).toInt(),
      userPhone: json['userPhone'] as String,
      requestType: (json['requestType'] as num).toInt(),
      productDetails: json['productDetails'] as String,
      requestedPrice: (json['requestedPrice'] as num).toDouble(),
      purchasePrice: (json['purchasePrice'] as num).toDouble(),
      serviceRequestStatus: (json['serviceRequestStatus'] as num).toInt(),
      submissionDate: json['submissionDate'] as String,
      responseDate: json['responseDate'] as String?,
      responseDetails: json['responseDetails'] as String?,
      images: (json['images'] as List<dynamic>)
          .map((e) => ImageData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ServiceRequestToJson(ServiceRequest instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'userPhone': instance.userPhone,
      'requestType': instance.requestType,
      'productDetails': instance.productDetails,
      'requestedPrice': instance.requestedPrice,
      'purchasePrice': instance.purchasePrice,
      'serviceRequestStatus': instance.serviceRequestStatus,
      'submissionDate': instance.submissionDate,
      'responseDate': instance.responseDate,
      'responseDetails': instance.responseDetails,
      'images': instance.images,
    };
