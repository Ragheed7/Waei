import 'package:waie/core/networking/api_error_handler.dart';
import 'package:waie/core/networking/api_result.dart';
import 'package:waie/core/networking/api_service.dart';
import 'package:waie/features/home/data/model/services/create_service_request.dart';
import 'package:waie/features/home/data/model/services/create_service_response.dart';

class CreateServiceRepository {
  final ApiService _apiService;

  CreateServiceRepository(this._apiService);

  Future<ApiResult<CreateServiceResponse>> createService(CreateServiceRequest request) async {
    try {
      final response = await _apiService.createService(request);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
