import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waie/features/cart/data/model/order_models/pay_order_request.dart';
import 'package:waie/features/cart/data/repository/order_repo.dart';
import 'package:waie/features/cart/logic/order%20logic/pay_order_state.dart';

class PayOrderCubit extends Cubit<PayOrderState> {
  final OrderRepo _orderRepo;

  PayOrderCubit(this._orderRepo) : super(const PayOrderState.initial());

  Future<void> payOrder(int orderId, PayOrderRequest request) async {
    emit(const PayOrderState.loading());

    final response = await _orderRepo.payOrder(orderId, request);

    response.when(
      success: (data) {
        if (data.isSuccess) {
          emit(PayOrderState.success(data));
        } else {
          emit(PayOrderState.failure(error: data.message ?? "Something went wrong in pay order cubit"));
        }
      },
      failure: (error) {
        emit(PayOrderState.failure(error: error.apiErrorModel.message ?? "An error occurred"));
      },
    );
  }
}
