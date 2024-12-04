import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waie/core/networking/api_result.dart';
import 'package:waie/features/home/data/model/services/get_user_services.dart';
import 'package:waie/features/home/data/repository/get_user_services_repo.dart';
import 'package:waie/features/home/logic/cubit/get_user_services_state.dart';

class GetUserServicesCubit extends Cubit<GetUserServicesState> {
  final GetUserServicesRepository _repository;

  GetUserServicesCubit(this._repository) : super(GetUserServicesState.initial());

  Future<void> fetchUserServices() async {
    emit(GetUserServicesState.loading());

    final ApiResult<GetUserServices> response = await _repository.fetchUserServices();

    response.when(
      success: (data) {
        if (data.isSuccess) {
          emit(GetUserServicesState.success(data));
        } else {
          emit(GetUserServicesState.failure(error: data.message ?? "Failed to fetch user services"));
        }
      },
      failure: (error) {
        emit(GetUserServicesState.failure(error: error.apiErrorModel.message ?? "An error occurred"));
      },
    );
  }
}
