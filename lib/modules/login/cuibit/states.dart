// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:doctor_app/core/networking/api_error_model.dart';
import 'package:doctor_app/modules/login/model/login_response_body.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  final LoginResponseBody loginResponseBody;
  LoginSuccessState({required this.loginResponseBody});
}

class LoginErrorState extends LoginStates {
  final ApiErrorModel apiErrorModel;
  LoginErrorState({required this.apiErrorModel});
}


class LoginPasswordValidationState extends LoginStates {

}
