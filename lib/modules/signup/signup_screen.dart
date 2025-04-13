import 'dart:developer';

import '../../core/theming/styles.dart';
import '../../core/widgets/defualt_terms_and_condition.dart';
import '../../core/widgets/defualt_textbutton.dart';
import 'cubit/signup_cubit.dart';
import 'widget/have_account.dart';
import 'widget/signup_bloc_listner.dart';
import 'widget/signup_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<SignupCubit>(context);
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
                  'Welcome,congratulations',
                  style: TextStyles.font24BlueSemiBold,
                ),

                const SizedBox(height: 10),
                Text(
                  "We're excited to use our app, can't wait to see what you've been up.",
                  style: TextStyles.font14greyRegular,
                ),

                SizedBox(height: 50.h),

                Column(
                  children: [
                    // fields widget
                    const SignupFields(),
                    const SizedBox(height: 24),

                    DefualtTextbutton(
                      buttonText: 'Sign Up',
                      textStyle:
                          TextStyles.font16WhiteSemiBold,
                      onPressed: () {
                        if (cubit.formKey.currentState!
                            .validate()) {
                          cubit.signupUser();
                          log('signup success');
                        }
                      },
                    ),

                    SizedBox(height: 16.h),

                    /// termes and conditions
                    const DefualtTermsAndCondition(
                      text1: 'By signing up',
                    ),

                    SizedBox(height: 20.h),
                    const HaveAccount(),
                    const SignupBlocListner(),
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

