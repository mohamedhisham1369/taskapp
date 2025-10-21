import 'package:easy_localization/easy_localization.dart';
import 'package:erp/core/routing/app_router.dart';
import 'package:erp/core/routing/routes_name.dart';
import 'package:erp/core/themes/themes.dart';
import 'package:erp/core/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Erp extends StatelessWidget {
  final AppRouter appRouter;

  const Erp({
    super.key,
    required this.appRouter,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
        ),
        child: Builder(builder: (context) {
          return MaterialApp(
            title: "job Task ",
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            navigatorKey: AppConstants.navigatorKey,
            themeMode: ThemeMode.light,
            darkTheme: lightTheme,
            initialRoute: AppConstants.userToken == null
                ? Routes.loginScreen
                : Routes.jobsScreen,
            // initialRoute: Routes.projectMangerMainLayout,

            onGenerateRoute: appRouter.generateRoute,
            builder: EasyLoading.init(),
          );
        }),
      ),
    );
  }
}
