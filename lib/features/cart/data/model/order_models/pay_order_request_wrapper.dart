import 'package:json_annotation/json_annotation.dart';
import 'pay_order_request.dart';

part 'pay_order_request_wrapper.g.dart';

@JsonSerializable(explicitToJson: true)
class PayOrderRequestWrapper {
  final PayOrderRequest payOrderDto;

  PayOrderRequestWrapper({required this.payOrderDto});

  factory PayOrderRequestWrapper.fromJson(Map<String, dynamic> json) =>
      _$PayOrderRequestWrapperFromJson(json);

  Map<String, dynamic> toJson() => _$PayOrderRequestWrapperToJson(this);
}
