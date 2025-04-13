import 'dart:developer';

import 'core/di/di.dart';
import 'core/helpers/observer/bloc_observer.dart';
import 'core/routing/routes_constant.dart';
import 'core/secure_storage/secure_constant.dart';
import 'core/secure_storage/secure_storage.dart';
import 'core/shared_prefrence/cach_helper.dart';
import 'my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  await Future.wait([
    CachHelper.init(),
    ScreenUtil.ensureScreenSize(),
  ]);

  final token = await SecureStorage.instance.read(
    SecureConstant.keyUserToken,
  );
  log(token.toString());

  String initialRoute = await Routes.getIntialRoute();

  setupGetIt();

  runApp(MyApp(initialRoute: initialRoute));
}
