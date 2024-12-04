import 'package:json_annotation/json_annotation.dart';

part 'create_service_response.g.dart';


@JsonSerializable()
class CreateServiceResponse {
  final bool result;
  final bool isSuccess;
  final String? message;

  CreateServiceResponse({
    required this.result,
    required this.isSuccess,
    this.message,
  });

  factory CreateServiceResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateServiceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateServiceResponseToJson(this);
}