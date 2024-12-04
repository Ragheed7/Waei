// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_service_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateServiceRequest _$CreateServiceRequestFromJson(
        Map<String, dynamic> json) =>
    CreateServiceRequest(
      requestType: (json['requestType'] as num).toInt(),
      productDetails: json['productDetails'] as String,
      requestedPrice: (json['requestedPrice'] as num).toDouble(),
      purchasePrice: (json['purchasePrice'] as num).toDouble(),
      imagesString64: (json['imagesString64'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$CreateServiceRequestToJson(
        CreateServiceRequest instance) =>
    <String, dynamic>{
      'requestType': instance.requestType,
      'productDetails': instance.productDetails,
      'requestedPrice': instance.requestedPrice,
      'purchasePrice': instance.purchasePrice,
      'imagesString64': instance.imagesString64,
    };
