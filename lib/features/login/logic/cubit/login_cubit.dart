import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:waie/core/di/dependency_injection.dart';
import 'package:waie/core/helpers/constants.dart';
import 'package:waie/core/helpers/shared_prefs_helper.dart';
import 'package:waie/core/shared_models/user_data/user_data.dart';
import 'package:waie/features/login/data/model/login_request_body.dart';
import 'package:waie/features/login/data/repository/login_repo.dart';
import 'package:waie/features/login/logic/cubit/login_state.dart';
import 'package:waie/features/login/logic/cubit/user_cubit.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  final LoginRepo _loginRepo;

  final formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();

  void emitLoginStates() async {
    emit(const LoginState.loading());

    // Get the phone number from the controller
    String phoneNumber = phoneController.text.trim();

    // Remove leading zero if present
    if (phoneNumber.startsWith('0')) {
      phoneNumber = phoneNumber.substring(1);
    }

    // Create the login request with the processed phone number
    final response = await _loginRepo.login(
      LoginRequestBody(
        phone: phoneNumber,
      ),
    );

    response.when(
      success: (loginResponse) async {
        final accessToken = loginResponse.result?.tokens?.accessToken ?? "";
        final refreshToken = loginResponse.result?.tokens?.refreshToken ?? "";

        // Save both tokens
        await saveTokens(accessToken, refreshToken);

        // Save UserData to local storage
        await saveUserData(loginResponse.result?.user);

        // Update UserCubit with UserData
        final userCubit = getIt<UserCubit>();
        userCubit.setUser(loginResponse.result?.user);

        emit(LoginState.success(loginResponse));
      },
      failure: (error) {
        emit(LoginState.error(error: error.apiErrorModel.message ?? ""));
      },
    );
  }

  Future<void> saveTokens(String accessToken, String refreshToken) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, accessToken);
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.refreshToken, refreshToken);
  }

  Future<void> saveUserData(UserData? userData) async {
    if (userData != null) {
      final userJson = jsonEncode(userData.toJson());
      print('Saving userData: $userJson');
      await SharedPrefHelper.setSecuredString(SharedPrefKeys.userData, userJson);
    }
  }

  @override
  Future<void> close() {
    phoneController.dispose();
    return super.close();
  }
}
