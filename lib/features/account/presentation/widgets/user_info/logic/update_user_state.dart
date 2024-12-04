import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_user_state.freezed.dart';

@freezed
class UpdateUserState<T> with _$UpdateUserState {
  const factory UpdateUserState.initial() = _Initial;
  const factory UpdateUserState.loading() = Loading;
  const factory UpdateUserState.success(T data) = Success<T>;
  const factory UpdateUserState.error({required String error}) = Error;
}