import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:erp/core/cache_helper/cache_helper.dart';
import 'package:erp/core/cache_helper/cache_keys.dart';
import 'package:erp/core/networks_helper/api_results/api_result.dart';
import 'package:erp/core/networks_helper/errors/exceptions.dart';
import 'package:erp/core/networks_helper/errors/failure.dart';
import 'package:erp/features/job%20details/data/api_services/job_details_api_services.dart';
import 'package:erp/features/jobs/data/models/job_model.dart';

class JobDetailsRepo {
  final JobDetailsApiServices jobDetailsApiServices;

  JobDetailsRepo(this.jobDetailsApiServices);

  static const String _cacheJobsKey = CacheKeys.jobsList;

  Future<ApiResult<JobModel>> getJobDetails(
    String id,
  ) async {
    final cachedString = CacheHelper.getData(key: _cacheJobsKey);
    final connectivityResult = await Connectivity().checkConnectivity();
    final isOffline = connectivityResult == ConnectivityResult.none;
    if (isOffline && cachedString != null) {
      try {
        final List decoded = jsonDecode(cachedString);
        final jobs = decoded.map((e) => JobModel.fromJson(e)).toList();
        final job = jobs.firstWhere((job) => job.id == id,
            orElse: () => throw Exception());
        return ApiResult.success(job);
      } catch (_) {
        return ApiResult.failure(
            FailureException(errMessage: 'No cached data for this job'));
      }
    }

    try {
      final response = await jobDetailsApiServices.getJobDetails(id);
      if (response?.statusCode == 200 || response?.statusCode == 201) {
        final job = JobModel.fromJson(response!.data);

        if (cachedString != null) {
          try {
            final List decoded = jsonDecode(cachedString);
            final jobs = decoded.map((e) => JobModel.fromJson(e)).toList();
            final index = jobs.indexWhere((j) => j.id == id);
            if (index != -1) {
              jobs[index] = job;
            } else {
              jobs.add(job);
            }
            await CacheHelper.saveData(
                key: _cacheJobsKey,
                value: jsonEncode(jobs.map((e) => e.toJson()).toList()));
          } catch (_) {}
        }

        return ApiResult.success(job);
      } else {
        return ApiResult.failure(
            ServerException.fromResponse(response?.statusCode, response));
      }
    } on DioException catch (e) {
      if (cachedString != null) {
        try {
          final List decoded = jsonDecode(cachedString);
          final jobs = decoded.map((e) => JobModel.fromJson(e)).toList();
          final job = jobs.firstWhere((job) => job.id == id,
              orElse: () => throw Exception());
          return ApiResult.success(job);
        } catch (_) {}
      }

      try {
        handleDioException(e);
      } on ServerException catch (ex) {
        return ApiResult.failure(ex.errorModel.errorMessage);
      }
    }

    return ApiResult.failure(
        FailureException(errMessage: 'Unexpected error occurred'));
  }

  Future<ApiResult<JobModel>> updateJobStatus(
    String id,
    String status,
  ) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    final isOffline = connectivityResult == ConnectivityResult.none;
    if (isOffline) {
      
      return ApiResult.failure(
          FailureException(errMessage: 'Cannot update status while offline'));

    }else {

    }

    try {
      final response = await jobDetailsApiServices.updateJobStatus(id, status);

      if (response?.statusCode == 200 || response?.statusCode == 201) {
        final updatedJob = JobModel.fromJson(response!.data);

        final cachedString = CacheHelper.getData(key: _cacheJobsKey);
        if (cachedString != null) {
          try {
            final List decoded = jsonDecode(cachedString);
            final jobs = decoded.map((e) => JobModel.fromJson(e)).toList();
            final index = jobs.indexWhere((j) => j.id == id);
            if (index != -1) {
              jobs[index] = updatedJob;
              await CacheHelper.saveData(
                key: _cacheJobsKey,
                value: jsonEncode(jobs.map((e) => e.toJson()).toList()),
              );
            }
          } catch (_) {}
        }

        return ApiResult.success(updatedJob);
      } else {
        return ApiResult.failure(
            ServerException.fromResponse(response?.statusCode, response));
      }
    } on DioException catch (e) {
      try {
        handleDioException(e);
      } on ServerException catch (ex) {
        return ApiResult.failure(ex.errorModel.errorMessage);
      }
    }

    return ApiResult.failure(
        FailureException(errMessage: 'Unexpected error occurred'));
  }


}
