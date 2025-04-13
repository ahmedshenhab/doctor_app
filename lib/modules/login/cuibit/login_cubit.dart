import '../../../core/secure_storage/secure_constant.dart';
import '../../../core/secure_storage/secure_storage.dart';
import 'states.dart';
import '../model/login_request_body.dart';
import '../repo/login_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer';
import '../../../core/helpers/app_regx.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(this._loginRepo) : super(LoginInitialState()) {
    passwordController.addListener(_passwordListener);
  }

  final LoginRepo _loginRepo;
  final formKey = GlobalKey<FormState>();

  final TextEditingController emailController =
      TextEditingController();
  final TextEditingController passwordController =
      TextEditingController();

  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialChar = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  Future<void> userLogin() async {
    emit(LoginLoadingState());

    final resultRepo = await _loginRepo.userLogin(
      LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );

    resultRepo.fold(
      (l) => emit(
        LoginErrorState(apiErrorModel: l),
      ),
      (r) async {
        await SecureStorage.instance.write(
          SecureConstant.keyUserToken,
          r.data.token,
        );

        emit(LoginSuccessState(loginResponseBody: r));
      },
    );
  }

  void _passwordListener() {
    // final text = passwordController.text;

    hasLowercase = AppRegex.hasLowerCase(
      passwordController.text,
    );
    hasUppercase = AppRegex.hasUpperCase(
      passwordController.text,
    );
    hasSpecialChar = AppRegex.hasSpecialCharacter(
      passwordController.text,
    );
    hasNumber = AppRegex.hasNumber(passwordController.text);
    hasMinLength = AppRegex.hasMinLength(
      passwordController.text,
    );

    log('Password Validation Updated');

    // Emit state instead of using setState()
    emit(LoginPasswordValidationState());
  }

  @override
  Future<void> close() {
    passwordController.removeListener(_passwordListener);
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
