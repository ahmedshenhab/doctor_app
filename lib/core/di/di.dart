import 'dart:developer';

import 'package:dio/dio.dart';
import '../networking/dio/dio_helper.dart';
import '../../modules/home/repo/home_repo.dart';
import '../../modules/login/repo/login_repo.dart';
import '../../modules/signup/repo/signup_repo.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setupGetIt() {
  Dio dio = DioHelper.init;

  // login dio
  getIt.registerLazySingleton<Dio>(() => dio);

  // login repo
  getIt.registerLazySingleton<LoginRepo>(
    () => LoginRepo(dio: getIt<Dio>()),
  );

  // login cubit
  // getIt.registerFactory<LoginCubit>(
  //   () => LoginCubit(getIt<LoginRepo>()),
  // );
  // signup repo
  getIt.registerLazySingleton<SignupRepo>(
    () => SignupRepo(dio: getIt<Dio>()),
  );

  // signup cubit
  // getIt.registerFactory<SignupCubit>(
  //   () => SignupCubit(getIt<SignupRepo>()),
  // );

  // home repo
  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepo(dio: getIt<Dio>()),
  );
  // home cubit
  // getIt.registerFactory<HomeCubit>(
  //   () => HomeCubit(getIt<HomeRepo>()),
  // );

  log('successfull setupGetIt');
}
