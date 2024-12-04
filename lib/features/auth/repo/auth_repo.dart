import 'package:dio/dio.dart';
import 'package:waie/core/helpers/constants.dart';
import 'package:waie/core/helpers/shared_prefs_helper.dart';
import 'package:waie/core/networking/api_service.dart';
import 'package:waie/core/networking/dio_factory.dart';
import 'package:waie/features/auth/model/refresh_token_request_body.dart';

class AuthRepository {
  final ApiService _apiService;

  AuthRepository(this._apiService);

  /// Refreshes the access token using the refresh token.
  Future<bool> refreshToken() async {
    try {
      final accessToken =
          await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
      final refreshToken =
          await SharedPrefHelper.getSecuredString(SharedPrefKeys.refreshToken);

      if (accessToken == null ||
          accessToken.isEmpty ||
          refreshToken == null ||
          refreshToken.isEmpty) {
        return false;
      }

      final response = await _apiService.refreshToken(
        RefreshTokenRequestBody(
          accessToken: accessToken,
          refreshToken: refreshToken,
        ),
      );

      if (response.isSuccess == true && response.result != null) {
        final newAccessToken = response.result!.accessToken ?? '';
        final newRefreshToken = response.result!.refreshToken ?? '';

        await saveTokens(newAccessToken, newRefreshToken);

        return true;
      } else {
        // Refresh token invalid or expired
        await logout();
        return false;
      }
    } catch (e) {
      // Handle exceptions (e.g., network errors)
      await logout();
      return false;
    }
  }

  /// Saves both access and refresh tokens.
  Future<void> saveTokens(String accessToken, String refreshToken) async {
    await SharedPrefHelper.setSecuredString(
        SharedPrefKeys.userToken, accessToken);
    await SharedPrefHelper.setSecuredString(
        SharedPrefKeys.refreshToken, refreshToken);
  }
  
  /// Retries the failed request with updated headers.
  Future<Response> retryRequest(RequestOptions options) async {
    final dio = await DioFactory.getDio();
    return dio.fetch(options);
  }
    
  /// Logs out the user by clearing tokens and user data.
  Future<void> logout() async {
    await SharedPrefHelper.deleteSecuredString(SharedPrefKeys.userToken);
    await SharedPrefHelper.deleteSecuredString(SharedPrefKeys.refreshToken);
    // await SharedPrefHelper.deleteSecuredString(SharedPrefKeys.userData);
  }
}
