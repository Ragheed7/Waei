import 'package:waie/core/networking/api_error_handler.dart';
import 'package:waie/core/networking/api_result.dart';
import 'package:waie/core/networking/api_service.dart';
import 'package:waie/core/shared_models/default_api_response.dart';
import 'package:waie/features/cart/data/model/add_to_cart_item_request.dart';
import 'package:waie/features/cart/data/model/get_cart_items.dart';
import 'package:waie/features/cart/data/model/remove_from_cart_item_request.dart';

class CartRepo {
  final ApiService _apiService;

  CartRepo(this._apiService);

  Future<ApiResult<DefaultApiResponse>> addItemToCart(AddToCartItemRequest request) async {
    try {
      final response = await _apiService.addItemToCart(request);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<DefaultApiResponse>> removeItemFromCart(RemoveFromCartItemRequest request) async {
    try {
      final response = await _apiService.removeItemFromCart(request);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<GetCartItems>> getCartItems() async {
    try {
      final response = await _apiService.getCartItems();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
