import 'package:dio/dio.dart';

import 'api_error_model.dart';

class ErrorHandler implements Exception {
  // late ApiErrorModel apiErrorModel;

  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          return ApiErrorModel(
            message: 'connection to server failed',
          );

        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(
            message: 'connection timed out with server ',
          );

        case DioExceptionType.cancel:
          return ApiErrorModel(
            message: 'request to server was cancelled',
          );

        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(
            message: 'receive timeout with server',
          );

        case DioExceptionType.unknown:
          return ApiErrorModel(
            message:
                ' connection to server failed due to internet connection',
          );

        case DioExceptionType.sendTimeout:
          return ApiErrorModel(
            message: 'send timeout with server',
          );

        case DioExceptionType.badResponse:
          return _handleError(error);

        default:
          return ApiErrorModel(
            message: 'something went wrong',
          );
      }
    } else {
      return ApiErrorModel(
        message: 'unknown error occured',
      );
    }
  }
}

ApiErrorModel _handleError(dynamic error) {
  return ApiErrorModel.fromJson(error.response!.data);
}
