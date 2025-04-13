// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:doctor_app/core/networking/api_constants.dart';
import 'package:doctor_app/core/networking/api_error_handler.dart';
import 'package:doctor_app/core/networking/api_error_model.dart';
import 'package:doctor_app/modules/login/model/login_request_body.dart';
import 'package:doctor_app/modules/login/model/login_response_body.dart';

class LoginRepo {
  final Dio dio;
  LoginRepo({required this.dio});

  Future<Either<ApiErrorModel, LoginResponseBody>> userLogin(
    LoginRequestBody loginRequestBody,
  ) async {
    try {
      final response = await dio.post(
       
        ApiConstants.login,
        data: loginRequestBody.toJson(),
      );

      return right(
        LoginResponseBody.fromJson(response.data),
      );
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }
}
