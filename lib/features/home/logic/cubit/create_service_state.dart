import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:waie/features/home/data/model/services/create_service_response.dart';

part 'create_service_state.freezed.dart';

@freezed
class CreateServiceState with _$CreateServiceState {
  const factory CreateServiceState.initial() = Initial;
  const factory CreateServiceState.loading() = Loading;
  const factory CreateServiceState.success(CreateServiceResponse data) = Success;
  const factory CreateServiceState.failure({required String error}) = Failure;
}
