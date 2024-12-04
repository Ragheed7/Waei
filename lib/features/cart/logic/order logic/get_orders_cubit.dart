import 'package:bloc/bloc.dart';
import 'package:waie/core/networking/api_error_handler.dart';
import 'package:waie/features/cart/data/repository/order_repo.dart';
import 'get_orders_state.dart';

class GetOrdersCubit extends Cubit<GetOrdersState> {
  final OrderRepo _orderRepo;

  GetOrdersCubit(this._orderRepo) : super(const GetOrdersState.initial());

  Future<void> fetchOrders() async {
    emit(const GetOrdersState.loading());

    final response = await _orderRepo.getOrders();

    response.when(
      success: (data) {
        if (data.isSuccess) {
          emit(GetOrdersState.success(data));
        } else {
          emit(GetOrdersState.failure(error: data.message ?? "Unknown error"));
        }
      },
      failure: (error) {
        final errorHandler = ErrorHandler.handle(error);
        emit(GetOrdersState.failure(error: errorHandler.apiErrorModel.message ?? "An error occurred"));
      },
    );
  }
}
