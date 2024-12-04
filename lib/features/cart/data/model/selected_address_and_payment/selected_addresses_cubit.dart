import 'package:bloc/bloc.dart';
import 'package:waie/core/shared_models/user_addresses/data/model/get_addresses.dart';
import 'package:waie/core/shared_models/user_addresses/logic/address_state.dart';

class SelectedAddressCubit extends Cubit<AddressState<Address>> {
  SelectedAddressCubit() : super(AddressState.initial());

  void selectAddress(Address address) {
    emit(AddressState.success(address));
  }

  void clearSelection() {
    emit(AddressState.initial());
  }
}
