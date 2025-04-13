
import 'dart:developer';

import 'package:doctor_app/core/helpers/app_regx.dart';
import 'package:doctor_app/modules/signup/cubit/signup_state.dart';
import 'package:doctor_app/modules/signup/model/signup_request_body.dart';
import 'package:doctor_app/modules/signup/model/signup_response_body.dart';
import 'package:doctor_app/modules/signup/repo/signup_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit<SignupStates> {
  SignupCubit(this._signupRepo)
    : super(SignupInitialState()) {
    passwordController.addListener(_passwordListener);
  }
  late final SignupRepo _signupRepo;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPassController = TextEditingController();
  final phoneController = TextEditingController();
  late SignupResponseBody signupResponseBody;

  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSepcialChar = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  final formKey = GlobalKey<FormState>();

  Future<void> signupUser() async {
    emit(SignupLoadingState());

    final response = await _signupRepo.userSignup(
      SignupRequestBody(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        passwordConfirmation: confirmPassController.text,
        gender: '0',
        phone: phoneController.text,
      ),
    );
    response.fold(
      (l) {
        emit(SignupErrorState(apiErrorModel: l));
      },
      (r) {
        emit(SignupSuccessState(signupResponseBody: r));
        signupResponseBody = r;
      },
    );
  }

  void _passwordListener() {
    hasLowercase = AppRegex.hasLowerCase(
      passwordController.text,
    );
    log('hasLowercase $hasLowercase');
    hasUppercase = AppRegex.hasUpperCase(
      passwordController.text,
    );
    log('hasUppercase $hasUppercase');
    hasSepcialChar = AppRegex.hasSpecialCharacter(
      passwordController.text,
    );
    log('hasSepcialChar $hasSepcialChar');
    hasNumber = AppRegex.hasNumber(passwordController.text);
    log('hasNumber $hasNumber');
    hasMinLength = AppRegex.hasMinLength(
      passwordController.text,
    );
    log('hasMinLength $hasMinLength');

    emit(SignupPasswordValidationState());
  }

  @override
  Future<void> close() {
    passwordController.removeListener(_passwordListener);
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPassController.dispose();
    phoneController.dispose();
    return super.close();
  }
}
