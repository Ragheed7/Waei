import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_state.freezed.dart';

@freezed
class AddressState<T> with _$AddressState<T> {
  const factory AddressState.initial() = _Initial;
  const factory AddressState.loading() = Loading;
  const factory AddressState.success(T data) = Success<T>;
  const factory AddressState.addressCreated(T data) = AddressCreated<T>;
  const factory AddressState.addressUpdated(T data) = AddressUpdated<T>;
  const factory AddressState.error({required String error}) = Error;
}
