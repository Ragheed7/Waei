import 'package:waie/core/networking/api_error_handler.dart';
import 'package:waie/core/networking/api_result.dart';
import 'package:waie/core/networking/api_service.dart';
import 'package:waie/features/account/presentation/widgets/user_info/data/model/update_user_request.dart';
import 'package:waie/features/account/presentation/widgets/user_info/data/model/update_user_response.dart';

class UpdateUserRepo {
  final ApiService _apiService;

  UpdateUserRepo(this._apiService);

  Future<ApiResult<UpdateUserResponse>> updateUser(
      UpdateUserRequest updateUserRequest) async {
    try {
      final response = await _apiService.updateUser(updateUserRequest);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}