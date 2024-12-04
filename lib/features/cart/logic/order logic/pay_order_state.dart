import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:waie/features/cart/data/model/order_models/pay_order_response.dart';

part 'pay_order_state.freezed.dart';

@freezed
class PayOrderState with _$PayOrderState {
  const factory PayOrderState.initial() = Initial;
  const factory PayOrderState.loading() = Loading;
  const factory PayOrderState.success(PayOrderResponse data) = Success;
  const factory PayOrderState.failure({required String error}) = Failure;
}
