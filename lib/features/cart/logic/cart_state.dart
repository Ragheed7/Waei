import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:waie/core/shared_models/default_api_response.dart';
import 'package:waie/features/cart/data/model/get_cart_items.dart';

part 'cart_state.freezed.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.initial() = _CartInitial;
  const factory CartState.loading() = _CartLoading;
  const factory CartState.itemAdded(DefaultApiResponse data) = _CartItemAdded;
  const factory CartState.itemRemoved(DefaultApiResponse data) = _CartItemRemoved;
  const factory CartState.cartItemsFetched(GetCartItems data) = _CartItemsFetched;
  const factory CartState.success(DefaultApiResponse data) = _CartSuccess;
  const factory CartState.error({required String error}) = _CartError;
}
