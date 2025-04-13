import '../../../core/helpers/app_regx.dart';
import '../../../core/widgets/defualt_textformfield.dart';

import '../cuibit/login_cubit.dart';
import '../cuibit/states.dart';
import 'password_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginFields extends StatefulWidget {
  const LoginFields({super.key});

  @override
  State<LoginFields> createState() => _LoginFieldsState();
}

class _LoginFieldsState extends State<LoginFields> {
  bool obsecureText = true;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<LoginCubit>(context);

    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          // Email Field
          DefualtTextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: cubit.emailController,
            hintText: 'Email',
            validator: (String? value) {
              if (value!.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Enter a valid email';
              }
              return null;
            },
          ),

          const SizedBox(height: 18),

          // Password Field
          DefualtTextFormField(
            keyboardType: TextInputType.visiblePassword,
            controller: cubit.passwordController,
            validator: (String? value) {
              if (value!.isEmpty
              // || !AppRegex.isPasswordValid(value)
              ) {
                return 'Enter a valid password';
              }
              return null;
            },
            hintText: 'Password',
            obscureText: obsecureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  obsecureText = !obsecureText;
                });
              },
              child: Icon(
                obsecureText
                    ? Icons.visibility_off
                    : Icons.visibility,
              ),
            ),
          ),

          SizedBox(height: 20.h),

          // Password Validation (Listening to Cubit State)
          BlocBuilder<LoginCubit, LoginStates>(
            builder: (context, state) {
              switch (state) {
                case LoginPasswordValidationState():
                  return PasswordValidation(
                    hasLowercase: cubit.hasLowercase,
                    hasUppercase: cubit.hasUppercase,
                    hasSepcialChar: cubit.hasSpecialChar,
                    hasNumber: cubit.hasNumber,
                    hasMinLength: cubit.hasMinLength,
                  );

                default:
                  return PasswordValidation(
                    hasLowercase: cubit.hasLowercase,
                    hasUppercase: cubit.hasUppercase,
                    hasSepcialChar: cubit.hasSpecialChar,
                    hasNumber: cubit.hasNumber,
                    hasMinLength: cubit.hasMinLength,
                  );
              }
            },
          ),
        ],
      ),
    );
  }
}
