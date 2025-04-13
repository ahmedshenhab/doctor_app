import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:doctor_app/core/networking/api_error_model.dart';
import '../../../core/networking/api_constants.dart';
import '../../../core/networking/api_error_handler.dart';
import '../model/signup_request_body.dart';
import '../model/signup_response_body.dart';

class SignupRepo {
  final Dio dio;

  SignupRepo({required this.dio});

  Future<Either<ApiErrorModel, SignupResponseBody>> userSignup(
    SignupRequestBody signupRequestBody,
  ) async {
    try {
      final response = await dio.post(
        ApiConstants.register,
        data: signupRequestBody.toJson(),
      );
      return right(
        SignupResponseBody.fromJson(response.data),
      );
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }
}
