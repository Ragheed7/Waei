import 'package:json_annotation/json_annotation.dart';

part 'default_api_response.g.dart';

@JsonSerializable()
class DefaultApiResponse {
  final bool result;
  final bool isSuccess;
  final String? message;

  DefaultApiResponse({
    required this.result,
    required this.isSuccess,
    this.message,
  });

  factory DefaultApiResponse.fromJson(Map<String, dynamic> json) =>
      _$DefaultApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DefaultApiResponseToJson(this);
}
