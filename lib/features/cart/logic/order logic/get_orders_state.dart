import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:waie/features/cart/data/model/order_models/get_orders.dart';

part 'get_orders_state.freezed.dart';

@freezed
class GetOrdersState with _$GetOrdersState {
  const factory GetOrdersState.initial() = Initial;
  const factory GetOrdersState.loading() = Loading;
  const factory GetOrdersState.success(GetOrders data) = Success;
  const factory GetOrdersState.failure({required String error}) = Failure;
}
