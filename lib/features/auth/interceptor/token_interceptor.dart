import 'package:dio/dio.dart';
import 'package:waie/core/helpers/constants.dart';
import 'package:waie/core/helpers/shared_prefs_helper.dart';

class TokenInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // Add the Accept header
    options.headers['Accept'] = 'application/json';

    // Retrieve the token asynchronously
    String? token = await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);

    if (token != null && token.isNotEmpty) {
      // Add the Authorization header
      options.headers['Authorization'] = 'Bearer $token';
      print('Authorization Header Added: Bearer $token');
    } else {
      print('No token found, not adding Authorization header');
    }

    return handler.next(options);
  }
}
