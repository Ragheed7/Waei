import 'package:json_annotation/json_annotation.dart';

part 'lookup_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class LookupResponse<T> {
  final List<T> result;
  final bool isSuccess;
  final String? message;

  LookupResponse({
    required this.result,
    required this.isSuccess,
    this.message,
  });

  factory LookupResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$LookupResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(
    Object Function(T value) toJsonT,
  ) => _$LookupResponseToJson(this, toJsonT);
}
