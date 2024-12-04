import 'package:bloc/bloc.dart';
import 'package:waie/core/local_models/payment_model/payment_card.dart';

abstract class PaymentCardState {
  const PaymentCardState();
}

class PaymentCardInitial extends PaymentCardState {}

class PaymentCardSelected extends PaymentCardState {
  final PaymentCard selectedCard;

  const PaymentCardSelected(this.selectedCard);
}

class PaymentCardError extends PaymentCardState {
  final String error;

  const PaymentCardError(this.error);
}

class SelectedPaymentCardCubit extends Cubit<PaymentCardState> {
  SelectedPaymentCardCubit() : super(PaymentCardInitial());

  void selectPaymentCard(PaymentCard card) {
    emit(PaymentCardSelected(card));
  }

  void clearSelection() {
    emit(PaymentCardInitial());
  }
}
