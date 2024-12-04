import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:waie/core/networking/api_constants.dart';
import 'package:waie/core/networking/api_service.dart';
import 'package:waie/features/auth/interceptor/auth_interceptor.dart';
import 'package:waie/features/auth/interceptor/token_interceptor.dart';
import 'package:waie/features/auth/repo/auth_repo.dart';

class DioFactory {
  /// Private constructor to prevent instantiation
  DioFactory._();

  static Dio? _dio;

  static Future<Dio> getDio() async {
    Duration timeOut = const Duration(seconds: 60);

    if (_dio == null) {
      _dio = Dio();

      // Set base options
      _dio!.options.baseUrl = ApiConsts.baseUrl;
      _dio!.options.connectTimeout = timeOut; // 30 seconds
      _dio!.options.receiveTimeout = timeOut; // 30 seconds

      // Add logging interceptor
      _dio!.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
        ),
      );

    // TokenInterceptor
      _dio!.interceptors.add(TokenInterceptor());

      // AuthInterceptor (provide AuthRepository)
      final apiService = ApiService(_dio!);
      final authRepository = AuthRepository(apiService);
      _dio!.interceptors.add(AuthInterceptor(authRepository));
    }

    return _dio!;
  }

  /// Sets the Authorization header with the given [token].
  // static Future<void> setAuthorizationHeader(String token) async {
  //   if (_dio != null) {
  //     _dio!.options.headers['Authorization'] = 'Bearer $token';
  //   }
  // }
}
