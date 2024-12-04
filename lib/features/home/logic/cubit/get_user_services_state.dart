import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:waie/features/home/data/model/services/get_user_services.dart';

part 'get_user_services_state.freezed.dart';

@freezed
class GetUserServicesState with _$GetUserServicesState {
  const factory GetUserServicesState.initial() = Initial;
  const factory GetUserServicesState.loading() = Loading;
  const factory GetUserServicesState.success(GetUserServices data) = Success;
  const factory GetUserServicesState.failure({required String error}) = Failure;
}
