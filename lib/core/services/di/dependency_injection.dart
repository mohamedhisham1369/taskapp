import 'package:erp/core/networks_helper/dio_helper/dio_helper.dart';
import 'package:erp/features/auth/data/api_services/api_services.dart';
import 'package:erp/features/auth/data/repos/auth_repo.dart';
import 'package:erp/features/job%20details/data/api_services/job_details_api_services.dart';
import 'package:erp/features/job%20details/data/repo/job_details_repo.dart';
import 'package:erp/features/jobs/data/api_services/api_services.dart';
import 'package:erp/features/jobs/data/repos/all_jobs_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupDependencyInjection() async {
  getIt.registerLazySingleton<DioHelper>(() => DioHelper());
  getIt.registerLazySingleton<AuthApiServices>(() => AuthApiServices(getIt()));

  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository(getIt()));

  getIt.registerLazySingleton<JobsApiServices>(() => JobsApiServices(getIt()));

  getIt.registerLazySingleton<JobsRepo>(() => JobsRepo(getIt()));

  getIt.registerLazySingleton<JobDetailsRepo>(() => JobDetailsRepo(getIt()));

  getIt.registerLazySingleton<JobDetailsApiServices>(
      () => JobDetailsApiServices(getIt()));
}
