import 'package:waie/core/networking/api_error_handler.dart';
import 'package:waie/core/networking/api_result.dart';
import 'package:waie/core/networking/api_service.dart';
import 'package:waie/core/shared_models/default_api_response.dart';
import 'package:waie/core/shared_models/user_addresses/data/model/create_address.dart';
import 'package:waie/core/shared_models/user_addresses/data/model/create_address_response.dart';
import 'package:waie/core/shared_models/user_addresses/data/model/get_addresses.dart';
import 'package:waie/core/shared_models/user_addresses/data/model/update_address.dart';

class AddressRepo {
  final ApiService _apiService;

  AddressRepo(this._apiService);

  Future<ApiResult<GetAddresses>> getAddresses() async {
    try {
      final response = await _apiService.getAddresses();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<DefaultApiResponse>> updateAddress(UpdateAddress updateAddress) async {
    try {
      final response = await _apiService.updateAddress(updateAddress);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<CreateAddressResponse>> createAddress(CreateAddress createAddress) async {
    try {
      final response = await _apiService.createAddress(createAddress);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
