import 'package:bloc/bloc.dart';
import 'package:waie/core/networking/api_result.dart';
import 'package:waie/features/account/presentation/widgets/user_info/data/model/update_user_request.dart';
import 'package:waie/features/account/presentation/widgets/user_info/data/model/update_user_response.dart';
import 'package:waie/features/account/presentation/widgets/user_info/data/repository/update_user_repo.dart';
import 'package:waie/features/account/presentation/widgets/user_info/logic/update_user_state.dart';


class UpdateUserCubit extends Cubit<UpdateUserState<UpdateUserResponse>> {
  final UpdateUserRepo _updateUserRepo;

  UpdateUserCubit(this._updateUserRepo) : super(const UpdateUserState.initial());

  Future<void> updateUser(UpdateUserRequest updateUserRequest) async {
    emit(const UpdateUserState.loading());

    final ApiResult<UpdateUserResponse> response = await _updateUserRepo.updateUser(updateUserRequest);

    response.when(
      success: (updateUserResponse) {
        emit(UpdateUserState.success(updateUserResponse));
      },
      failure: (error) {
        emit(UpdateUserState.error(error: error.apiErrorModel.message ?? 'An unknown error occurred'));
      },
    );
  }
}
