import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:doctor_app/core/networking/api_error_model.dart';
import '../../../core/networking/api_constants.dart';
import '../../../core/networking/api_error_handler.dart';
import '../../../core/secure_storage/secure_constant.dart';
import '../../../core/secure_storage/secure_storage.dart';
import '../model/speciality_response_model.dart';

class HomeRepo {
  final Dio dio;
  HomeRepo({required this.dio});

  Future<Either<ApiErrorModel, SpecialityResponseModel>>
  getSpecializations() async {

      final token =  await   SecureStorage.instance.read(SecureConstant.keyUserToken);
    try {
      final response = await dio.get(
        options: Options(
          headers: {
            'Authorization':
                'Bearer $token',
          },
        ),

        ApiConstants.specialityDoctors,
      );
      return right(
        SpecialityResponseModel.fromJson(response.data),
      );
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }
}
