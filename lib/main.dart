import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:erp/core/cache_helper/cache_helper.dart';
import 'package:erp/core/cache_helper/cache_keys.dart';
import 'package:erp/core/networks_helper/dio_helper/dio_helper.dart';
import 'package:erp/core/routing/app_router.dart';
import 'package:erp/core/services/di/dependency_injection.dart';
import 'package:erp/core/utils/app_constants.dart';
import 'package:erp/core/utils/bloc_observer.dart';
import 'package:erp/jobs_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupDependencyInjection();
  await DioHelper.init();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  await EasyLocalization.ensureInitialized();
  await CacheHelper.init();

  await ScreenUtil.ensureScreenSize();

  Bloc.observer = MyBlocObserver();

  AppConstants.userToken =
      await CacheHelper.getSecuredString(key: CacheKeys.userToken);

  runApp(
    EasyLocalization(
      saveLocale: true,
      useFallbackTranslations: true,
      fallbackLocale: const Locale('ar', 'EG'),
      supportedLocales: const [
        Locale('ar', 'EG'),
        Locale('en', 'UK'),
      ],
      path: 'assets/languages',
      child: Phoenix(
        child: Erp(
          appRouter: AppRouter(),
        ),
      ),
    ),
  );
}
