import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:waie/features/cart/data/model/order_models/create_order_response.dart';

part 'create_order_state.freezed.dart';

@freezed
class CreateOrderState with _$CreateOrderState {
  const factory CreateOrderState.initial() = _Initial;
  const factory CreateOrderState.loading() = _Loading;
  const factory CreateOrderState.success(CreateOrderResponse data) = _Success;
  const factory CreateOrderState.failure({required String error}) = _Failure;
}
