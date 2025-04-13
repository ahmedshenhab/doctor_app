import '../../../core/helpers/app_regx.dart';
import '../../../core/widgets/defualt_textformfield.dart';
import '../../login/widgets/password_validation.dart';
import '../cubit/signup_cubit.dart';
import '../cubit/signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupFields extends StatefulWidget {
  const SignupFields({super.key});

  @override
  State<SignupFields> createState() => _SignupFieldsState();
}

class _SignupFieldsState extends State<SignupFields> {
  bool obsecureText = true;

  late SignupCubit cubit;

  @override
  Widget build(BuildContext context) {
    cubit = BlocProvider.of<SignupCubit>(context);
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          // name
          DefualtTextFormField(
            keyboardType: TextInputType.name,
            controller: cubit.nameController,

            hintText: 'name',

            validator: (String? value) {
              if (value!.isEmpty || value.length < 3) {
                return 'must be at least 3 characters';
              }
              return null;
            },
          ),

          const SizedBox(height: 18),

          // email
          DefualtTextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: cubit.emailController,

            hintText: 'Email',

            validator: (String? value) {
              if (value!.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return ' enter valid email must';
              }
              return null;
            },
          ),

          const SizedBox(height: 18),
          // password
          DefualtTextFormField(
            keyboardType: TextInputType.visiblePassword,
            controller: cubit.passwordController,

            validator: (String? value) {
              if (value!.isEmpty
              // ||
              //     !AppRegex.isPasswordValid(value)
              ) {
                return ' enter valid password must';
              }
              return null;
            },

            hintText: 'password',

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

          const SizedBox(height: 18),

          // confirm password
          DefualtTextFormField(
            controller: cubit.confirmPassController,
            keyboardType: TextInputType.visiblePassword,

            validator: (String? value) {
              if (value != cubit.passwordController.text) {
                return 'password not matched';
              }
              return null;
            },

            hintText: 'confirm password',

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

          // password validation
          BlocBuilder<SignupCubit, SignupStates>(
            builder: (context, state) {
              switch (state) {
                case SignupPasswordValidationState():
                  return PasswordValidation(
                    hasLowercase: cubit.hasLowercase,
                    hasUppercase: cubit.hasUppercase,
                    hasSepcialChar: cubit.hasSepcialChar,
                    hasNumber: cubit.hasNumber,
                    hasMinLength: cubit.hasMinLength,
                  );

                default:
                  return PasswordValidation(
                    hasLowercase: cubit.hasLowercase,
                    hasUppercase: cubit.hasUppercase,
                    hasSepcialChar: cubit.hasSepcialChar,
                    hasNumber: cubit.hasNumber,
                    hasMinLength: cubit.hasMinLength,
                  );
              }
            },
          ),

          const SizedBox(height: 18),

          // phone
          DefualtTextFormField(
            keyboardType: TextInputType.phone,
            controller: cubit.phoneController,

            hintText: 'phone',

            validator: (String? value) {
              if (value!.isEmpty ||
                  AppRegex.isPhoneNumberValid(value)) {
                return ' enter correct  phone ';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
