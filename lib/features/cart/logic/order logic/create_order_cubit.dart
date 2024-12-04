import 'package:bloc/bloc.dart';
import 'package:waie/features/cart/data/model/order_models/create_order_request.dart';
import 'package:waie/features/cart/data/repository/order_repo.dart';
import 'package:waie/features/cart/logic/order%20logic/create_order_state.dart';

class CreateOrderCubit extends Cubit<CreateOrderState> {
  final OrderRepo _orderRepo;

  CreateOrderCubit(this._orderRepo) : super(const CreateOrderState.initial());

  Future<void> createOrder(CreateOrderRequest request) async {
    emit(const CreateOrderState.loading());

    final response = await _orderRepo.createOrder(request);

    response.when(
      success: (data) {
        if (data.isSuccess) {
          emit(CreateOrderState.success(data));
        } else {
          emit(CreateOrderState.failure(error: data.message?? "Sorry, can't create order"));
        }
      },
      failure: (error) {
        emit(CreateOrderState.failure(error: error.apiErrorModel.message ?? "An error occurred"));
      },
    );
  }
}
