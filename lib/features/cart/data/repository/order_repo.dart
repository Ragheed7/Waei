import 'package:waie/core/networking/api_error_handler.dart';
import 'package:waie/core/networking/api_result.dart';
import 'package:waie/core/networking/api_service.dart';
import 'package:waie/features/cart/data/model/order_models/create_order_request.dart';
import 'package:waie/features/cart/data/model/order_models/create_order_response.dart';
import 'package:waie/features/cart/data/model/order_models/get_orders.dart';
import 'package:waie/features/cart/data/model/order_models/pay_order_request.dart';
import 'package:waie/features/cart/data/model/order_models/pay_order_request_wrapper.dart';
import 'package:waie/features/cart/data/model/order_models/pay_order_response.dart';

class OrderRepo {
  final ApiService _apiService;

  OrderRepo(this._apiService);

  Future<ApiResult<CreateOrderResponse>> createOrder(CreateOrderRequest request) async {
    try {
      final response = await _apiService.createOrder(request);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<PayOrderResponse>> payOrder(int orderId, PayOrderRequest request) async {
    try {
      // final wrappedRequest = PayOrderRequestWrapper(payOrderDto: request);
      final response = await _apiService.payOrder(orderId, request);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

   Future<ApiResult<GetOrders>> getOrders() async {
    try {
      final response = await _apiService.getOrders();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
