import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:erp/core/cache_helper/cache_helper.dart';
import 'package:erp/core/cache_helper/cache_keys.dart';
import 'package:erp/core/networks_helper/api_results/api_result.dart';
import 'package:erp/core/networks_helper/errors/exceptions.dart';
import 'package:erp/core/networks_helper/errors/failure.dart';
import 'package:erp/features/jobs/data/api_services/api_services.dart';
import 'package:erp/features/jobs/data/models/job_model.dart';

class JobsRepo {
  final JobsApiServices jobsApiServices;

  JobsRepo(this.jobsApiServices);

  static const String _cacheJobsKey = CacheKeys.jobsList;

  Future<ApiResult<List<JobModel>>> getJobs({
    required int page,
    int limit = 10,
    bool forceRefresh = false,
    bool isOffline = false,
  }) async {
    List<JobModel> cachedJobs = [];
    final cachedString = CacheHelper.getData(key: _cacheJobsKey);
    if (cachedString != null) {
      try {
        final List decoded = jsonDecode(cachedString);
        cachedJobs = decoded.map((e) => JobModel.fromJson(e)).toList();
      } catch (_) {
        cachedJobs = [];
      }
    }

    if (isOffline) {
      if (page == 1) return ApiResult.success(cachedJobs);
      return ApiResult.success([]);
    }

    try {
      final response = await jobsApiServices.getJobs(page: page, limit: limit);

      if (response?.statusCode == 200 || response?.statusCode == 201) {
        final List data = response!.data;
        final fetchedJobs = data.map((e) => JobModel.fromJson(e)).toList();

        for (var job in fetchedJobs) {
          final index = cachedJobs.indexWhere((j) => j.id == job.id);
          if (index == -1) {
            cachedJobs.add(job);
          } else {
            cachedJobs[index] = job;
          }
        }

        await CacheHelper.saveData(
          key: _cacheJobsKey,
          value: jsonEncode(cachedJobs.map((e) => e.toJson()).toList()),
        );

        return ApiResult.success(fetchedJobs);
      } else {
        return ApiResult.failure(
          ServerException.fromResponse(response?.statusCode, response),
        );
      }
    } on DioException catch (e) {
      if (cachedJobs.isNotEmpty && page == 1) {
        return ApiResult.success(cachedJobs);
      }
      if (page > 1) return ApiResult.success([]);

      try {
        handleDioException(e);
      } on ServerException catch (ex) {
        return ApiResult.failure(ex.errorModel.errorMessage);
      }
    }

    return ApiResult.failure(
      FailureException(errMessage: 'Unexpected error occurred'),
    );
  }
}
