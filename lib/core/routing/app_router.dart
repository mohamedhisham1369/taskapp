import 'package:erp/core/routing/routes_name.dart';
import 'package:erp/core/services/di/dependency_injection.dart';
import 'package:erp/features/auth/business_logic/auth_cubit.dart';
import 'package:erp/features/auth/presentation/screens/login_screen.dart';
import 'package:erp/features/job%20details/cubit/job_details_cubit.dart';
import 'package:erp/features/job%20details/presentation/screen/job_details_screen.dart';
import 'package:erp/features/jobs/cubit/jobs_cubit.dart';
import 'package:erp/features/jobs/data/models/job_model.dart';
import 'package:erp/features/jobs/presentation/screen/all_jobs_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    PageTransition transition<T extends Cubit<Object>>({
      required Widget screen,
      T? cubit,
      Object? arguments,
      PageTransitionType type = PageTransitionType.fade,
      Duration duration = const Duration(milliseconds: 200),
      Alignment alignment = Alignment.center,
    }) {
      final child = cubit != null
          ? BlocProvider<T>(
              create: (context) => cubit,
              child: screen,
            )
          : screen;

      return PageTransition(
        child: child,
        type: type,
        duration: duration,
        alignment: alignment,
        settings: settings,
      );
    }

    switch (settings.name) {
      case Routes.loginScreen:
        return transition(
            screen: const LoginScreen(), cubit: AuthCubit(getIt()));
      case Routes.jobDetailsScreen:
        final item = settings.arguments as JobModel;
        return transition(
          cubit: JobDetailsCubit(getIt())..getJobById(item.id),
          screen: JobDetailsScreen(),
        );

      case Routes.jobsScreen:
        return transition(
            screen: JobsScreen(),
            cubit: JobsCubit(getIt())
              ..getJobs()
              ..setupScrollListener());
    }
    return null;
  }
}
