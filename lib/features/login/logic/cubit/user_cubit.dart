import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waie/core/helpers/constants.dart';
import 'package:waie/core/helpers/shared_prefs_helper.dart';
import 'package:waie/core/shared_models/user_data/user_data.dart';

class UserCubit extends Cubit<UserData?> {
  UserCubit() : super(null) {
    loadUserData();
  }

  Future<void> loadUserData() async {
    final userJson =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userData);
    if (userJson != null) {
      final userData = UserData.fromJson(jsonDecode(userJson));
      emit(userData);
    }
  }

  Future<void> updateUserData({String? userName, String? email}) async {
    if (state != null) {
      final updatedUserData = state!.copyWith(
        userName: userName ?? state!.userName,
        email: email ?? state!.email,
      );
      emit(updatedUserData);
      final userJson = jsonEncode(updatedUserData.toJson());
      await SharedPrefHelper.setSecuredString(
          SharedPrefKeys.userData, userJson);
    }
  }

  void setUser(UserData? userData) {
    emit(userData);
  }

  void clearUser() {
    emit(null);
  }
}
