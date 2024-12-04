import 'package:waie/core/networking/api_error_handler.dart';
import 'package:waie/core/networking/api_result.dart';
import 'package:waie/core/networking/api_service.dart';
import 'package:waie/features/home/data/model/services/get_user_services.dart';

class GetUserServicesRepository {
  final ApiService _apiService;

  GetUserServicesRepository(this._apiService);

  Future<ApiResult<GetUserServices>> fetchUserServices() async {
    try {
      final response = await _apiService.getUserServices();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
