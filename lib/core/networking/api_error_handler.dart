import 'package:dio/dio.dart';
import 'package:waie/core/networking/api_error_model.dart';

enum DataSource {
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORIZED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECEIVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT,
}

class ResponseCode {
  static const int SUCCESS = 200;
  static const int NO_CONTENT = 201;
  static const int BAD_REQUEST = 400;
  static const int UNAUTHORIZED = 401;
  static const int FORBIDDEN = 403;
  static const int NOT_FOUND = 404;
  static const int INTERNAL_SERVER_ERROR = 500;

  static const int API_LOGIC_ERROR = 422;

  // Local status codes
  static const int CONNECT_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int RECEIVE_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CACHE_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int DEFAULT = -7;
}

class ResponseMessage {
  static const String NO_CONTENT = "No Content available at the moment.";
  static const String BAD_REQUEST = "The request was invalid. Please check your input.";
  static const String UNAUTHORIZED = "You are not authorized to access this resource. Please log in again.";
  static const String FORBIDDEN = "You do not have permission to perform this action.";
  static const String INTERNAL_SERVER_ERROR = "There was an issue on the server. Please try again later.";
  static const String NOT_FOUND = "The resource you are looking for was not found.";
  static const String CONNECT_TIMEOUT = "Connection timed out. Please try again later.";
  static const String CANCEL = "Request was cancelled.";
  static const String RECEIVE_TIMEOUT = "The server took too long to respond. Please try again.";
  static const String SEND_TIMEOUT = "The request took too long to send. Please try again.";
  static const String CACHE_ERROR = "There was an issue with the cached data.";
  static const String NO_INTERNET_CONNECTION = "No internet connection. Please check your network.";
  static const String DEFAULT = "Something went wrong. Please try again later.";
}


extension DataSourceExtension on DataSource {
  ApiErrorModel getFailure() {
    switch (this) {
      case DataSource.NO_CONTENT:
        return ApiErrorModel(message: ResponseMessage.NO_CONTENT, isSuccess: false);
      case DataSource.BAD_REQUEST:
        return ApiErrorModel(message: ResponseMessage.BAD_REQUEST, isSuccess: false);
      case DataSource.UNAUTHORIZED:
        return ApiErrorModel(message: ResponseMessage.UNAUTHORIZED, isSuccess: false);
      case DataSource.FORBIDDEN:
        return ApiErrorModel(message: ResponseMessage.FORBIDDEN, isSuccess: false);
      case DataSource.NOT_FOUND:
        return ApiErrorModel(message: ResponseMessage.NOT_FOUND, isSuccess: false);
      case DataSource.INTERNAL_SERVER_ERROR:
        return ApiErrorModel(message: ResponseMessage.INTERNAL_SERVER_ERROR, isSuccess: false);
      case DataSource.CONNECT_TIMEOUT:
        return ApiErrorModel(message: ResponseMessage.CONNECT_TIMEOUT, isSuccess: false);
      case DataSource.CANCEL:
        return ApiErrorModel(message: ResponseMessage.CANCEL, isSuccess: false);
      case DataSource.RECEIVE_TIMEOUT:
        return ApiErrorModel(message: ResponseMessage.RECEIVE_TIMEOUT, isSuccess: false);
      case DataSource.SEND_TIMEOUT:
        return ApiErrorModel(message: ResponseMessage.SEND_TIMEOUT, isSuccess: false);
      case DataSource.CACHE_ERROR:
        return ApiErrorModel(message: ResponseMessage.CACHE_ERROR, isSuccess: false);
      case DataSource.NO_INTERNET_CONNECTION:
        return ApiErrorModel(message: ResponseMessage.NO_INTERNET_CONNECTION, isSuccess: false);
      case DataSource.DEFAULT:
        return ApiErrorModel(message: ResponseMessage.DEFAULT, isSuccess: false);
    }
  }
}


class ErrorHandler implements Exception {
  late ApiErrorModel apiErrorModel;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      apiErrorModel = _handleError(error);
    } else {
      apiErrorModel = DataSource.DEFAULT.getFailure();
      print("Unhandled error type: ${error.runtimeType}");
      print("Error details: $error"); // Log the error details
    }
    // Access the message correctly from the instance
    print("ErrorHandler: ${apiErrorModel.message}");
  }

  ApiErrorModel _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return DataSource.CONNECT_TIMEOUT.getFailure();
      case DioExceptionType.sendTimeout:
        return DataSource.SEND_TIMEOUT.getFailure();
      case DioExceptionType.receiveTimeout:
        return DataSource.RECEIVE_TIMEOUT.getFailure();
      case DioExceptionType.badResponse:
        if (error.response != null &&
            error.response?.statusCode != null &&
            error.response?.statusMessage != null &&
            error.response?.data != null &&
            error.response!.data is Map<String, dynamic>) {
          try {
            // Attempt to parse ApiErrorModel
            return ApiErrorModel.fromJson(error.response!.data);
          } catch (e, stacktrace) {
            print("Error parsing ApiErrorModel: $e");
            print("Stacktrace: $stacktrace");
            return DataSource.DEFAULT.getFailure();
          }
        } else {
          return DataSource.DEFAULT.getFailure();
        }
      case DioExceptionType.cancel:
        return DataSource.CANCEL.getFailure();
      case DioExceptionType.unknown:
        return DataSource.DEFAULT.getFailure();
      case DioExceptionType.connectionError:
        return DataSource.NO_INTERNET_CONNECTION.getFailure();
      case DioExceptionType.badCertificate:
        return DataSource.DEFAULT.getFailure();
    }
  }
}



  ApiErrorModel _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return DataSource.CONNECT_TIMEOUT.getFailure();
      case DioExceptionType.sendTimeout:
        return DataSource.SEND_TIMEOUT.getFailure();
      case DioExceptionType.receiveTimeout:
        return DataSource.RECEIVE_TIMEOUT.getFailure();
      case DioExceptionType.badResponse:
        if (error.response != null &&
            error.response?.statusCode != null &&
            error.response?.statusMessage != null &&
            error.response?.data != null &&
            error.response!.data is Map<String, dynamic>) {
          try {
            // Attempt to parse ApiErrorModel
            return ApiErrorModel.fromJson(error.response!.data);
          } catch (e, stacktrace) {
            print("Error parsing ApiErrorModel: $e");
            print("Stacktrace: $stacktrace");
            return DataSource.DEFAULT.getFailure();
          }
        } else {
          return DataSource.DEFAULT.getFailure();
        }
      case DioExceptionType.cancel:
        return DataSource.CANCEL.getFailure();
      case DioExceptionType.unknown:
        return DataSource.DEFAULT.getFailure();
      case DioExceptionType.connectionError:
        return DataSource.NO_INTERNET_CONNECTION.getFailure();
      case DioExceptionType.badCertificate:
        return DataSource.DEFAULT.getFailure();
    }
  }









// import 'package:dio/dio.dart';
// import 'api_error_model.dart';

// class ApiErrorHandler {
//   static String handleError(dynamic error) {
//     // Check if the error is DioException, which indicates an issue during the request
//     if (error is DioException) {
//       // Handle different types of Dio exceptions
//       switch (error.type) {
//         case DioExceptionType.connectionTimeout:
//         case DioExceptionType.sendTimeout:
//         case DioExceptionType.receiveTimeout:
//           return 'Connection timed out. Please try again later.';
        
//         case DioExceptionType.badResponse:
//           // A non-200 response was received, so we handle it
//           if (error.response != null) {
//             try {
//               // Try to parse the error using your ApiErrorModel
//               ApiErrorModel apiError = ApiErrorModel.fromJson(error.response!.data);
//               return apiError.message ?? 'An unknown error occurred';
//             } catch (e) {
//               // If parsing fails, return a generic message
//               return 'Failed to parse error response';
//             }
//           }
//           return 'Received an invalid response from the server.';

//         case DioExceptionType.cancel:
//           return 'Request was cancelled.';

//         case DioExceptionType.unknown:
//           return 'An unknown error occurred. Please check your connection.';

//         default:
//           return 'An unexpected error occurred.';
//       }
//     }
    
//     // Handle any other types of errors (not Dio related)
//     return 'An unexpected error occurred.';
//   }
// }