import '../di/di.dart';
import 'routes_constant.dart';
import '../../modules/home/cubit/home_cubit.dart';
import '../../modules/home/home_screen.dart';
import '../../modules/home/repo/home_repo.dart';
import '../../modules/login/cuibit/login_cubit.dart';
import '../../modules/login/login_screen.dart';
import '../../modules/login/repo/login_repo.dart';
import '../../modules/onBoarding/onboarding_screen.dart';
import '../../modules/signup/cubit/signup_cubit.dart';
import '../../modules/signup/repo/signup_repo.dart';
import '../../modules/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      //onboarding
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );
      //login
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create:
                    (context) =>
                        LoginCubit(getIt<LoginRepo>()),

                child: const LoginScreen(),
              ),
        );

      //register
      case Routes.registerScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create:
                    (context) =>
                        SignupCubit(getIt<SignupRepo>()),
                child: const SignupScreen(),
              ),
        );

      //homeScreen
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create:
                    (context) =>
                        HomeCubit(getIt<HomeRepo>())
                          ..getData(),
                child: const HomeScreen(),
              ),
        );

      default:
        return null;
    }
  }
}
