import 'dart:developer';

import '../../core/theming/styles.dart';
import '../../core/widgets/defualt_terms_and_condition.dart';
import '../../core/widgets/defualt_textbutton.dart';
import 'cuibit/login_cubit.dart';
import 'widgets/dont_have_account.dart';
import 'widgets/login_fields.dart';
import 'widgets/login_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<LoginCubit>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 30.w,
            vertical: 30.h,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  'Welcome Back',
                  style: TextStyles.font24BlueSemiBold,
                ),

                const SizedBox(height: 10),
                Text(
                  "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                  style: TextStyles.font14greyRegular,
                ),

                SizedBox(height: 100.h),

                Column(
                  children: [
                    // email and password
                    const LoginFields(),
                    const SizedBox(height: 24),

                    Align(
                      alignment:
                          AlignmentDirectional.centerEnd,
                      child: Text(
                        'Forgot Password?',
                        style: TextStyles.font12blueRegular,
                      ),
                    ),

                    SizedBox(height: 40.h),

                    DefualtTextbutton(
                      buttonText: 'Login',
                      textStyle:
                          TextStyles.font16WhiteSemiBold,
                      onPressed: () {
                        if (cubit.formKey.currentState!
                            .validate()) {
                          cubit.userLogin();
                          log('login success');
                        }
                      },
                    ),

                    SizedBox(height: 16.h),

                    /// termes and conditions
                    const DefualtTermsAndCondition(
                      text1: 'by logging in',
                    ),

                    SizedBox(height: 40.h),
                    const DontHaveAccount(),
                    const LoginBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
