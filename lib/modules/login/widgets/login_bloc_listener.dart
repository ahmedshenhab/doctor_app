import '../../../core/helpers/extentions.dart';
import '../../../core/routing/routes_constant.dart';
import '../../../core/theming/colors.dart';
import '../../../core/theming/styles.dart';
import '../cuibit/login_cubit.dart';
import '../cuibit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginStates>(
      listener: (context, state) {
        switch (state) {
          case LoginLoadingState():
            showDialog(
              context: context,
              builder:
                  (context) => const Center(
                    child: CircularProgressIndicator(
                      color: ColorManager.mainBlue,
                    ),
                  ),
            );

            break;
          case LoginSuccessState():
            context.pop();

            context.pushNamedAndRemoveUntil(
              Routes.homeScreen,
            );

            break;
          case LoginErrorState():
            context.pop();
            showDialog(
              context: context,
              builder:
                  (context) => AlertDialog(
                    title: const Text('Error!'),
                    content: Text(
                      state.apiErrorModel.getAllMessages(),
                      style:
                          TextStyles.font15DarkBlueMedium,
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          context.pop();
                        },
                        child: Text(
                          'OK,',
                          style:
                              TextStyles.font14BlueSemiBold,
                        ),
                      ),
                    ],
                  ),
            );
            break;
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
