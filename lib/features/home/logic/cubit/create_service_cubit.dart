import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waie/core/networking/api_result.dart';
import 'package:waie/features/home/data/model/services/create_service_request.dart';
import 'package:waie/features/home/data/model/services/create_service_response.dart';
import 'package:waie/features/home/data/repository/create_service_repo.dart';
import 'package:waie/features/home/logic/cubit/create_service_state.dart';

class CreateServiceCubit extends Cubit<CreateServiceState> {
  final CreateServiceRepository _repository;

  CreateServiceCubit(this._repository) : super(const CreateServiceState.initial());

  Future<void> submitCreateService(CreateServiceRequest request) async {
    emit(const CreateServiceState.loading());

    final ApiResult<CreateServiceResponse> response = await _repository.createService(request);

    response.when(
      success: (data) {
        if (data.isSuccess) {
          emit(CreateServiceState.success(data));
        } else {
          emit(CreateServiceState.failure(error: data.message ?? "Sorry, can't create service request"));
        }
      },
      failure: (error) {
        emit(CreateServiceState.failure(error: error.apiErrorModel.message ?? "An error occurred"));
      },
    );
  }
}
