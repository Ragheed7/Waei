import 'package:dio/dio.dart';
import 'package:waie/core/helpers/constants.dart';
import 'package:waie/core/helpers/shared_prefs_helper.dart';
import 'package:waie/core/networking/dio_factory.dart';
import 'package:waie/features/auth/repo/auth_repo.dart';

class AuthInterceptor extends Interceptor {
  final AuthRepository _authRepository;

  AuthInterceptor(this._authRepository);

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    // Check if the error is due to an expired access token
    if (err.response?.statusCode == 401) {
      RequestOptions options = err.requestOptions;

      // Attempt to refresh the token
      final success = await _authRepository.refreshToken();

      if (success) {
        // Retry the original request with the new access token
        String? newAccessToken =
            await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);

        if (newAccessToken != null && newAccessToken.isNotEmpty) {
          // Update the Authorization header
          options.headers['Authorization'] = 'Bearer $newAccessToken';

          // Create a new Dio instance to avoid interceptor recursion
          final cloneDio = await DioFactory.getDio();

          try {
            final response = await cloneDio.fetch(options);
            return handler.resolve(response);
          } catch (e) {
            // If retry fails, reject the error
            if (e is DioException) {
              return handler.reject(e);
            } else {
              return handler.reject(
                DioException(
                  requestOptions: options,
                  error: e,
                  type: DioExceptionType.unknown,
                ),
              );
            }
          }
        } else {
          // No new access token, logout
          await _authRepository.logout();
          return handler.next(err);
        }
      } else {
        // Refresh token failed, logout
        await _authRepository.logout();
        return handler.next(err);
      }
    } else {
      // Pass the error to the next handler
      handler.next(err);
    }
  }
}
