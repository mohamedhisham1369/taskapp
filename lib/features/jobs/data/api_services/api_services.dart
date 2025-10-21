import 'package:dio/dio.dart';
import 'package:erp/core/networks_helper/dio_helper/dio_helper.dart';
import 'package:erp/core/networks_helper/dio_helper/end_points.dart';

class JobsApiServices {
  final DioHelper _dio;

  JobsApiServices(this._dio);

  Future<Response?> getJobs({
    required int page,
    int limit = 10,
  }) async {
    return _dio.get(
      endPoint: EndPoints.jobs,
      data: {
        "page": page,
        "limit": limit,
      },
    );
  }

  Future<Response?> getJobDetails(String id) async {
    return _dio.get(
      endPoint: EndPoints.jobDetails(id),
    );
  }

  Future<Response?> updateJobStatus(String id, String status) async {
    return _dio.patch(
      endPoint: EndPoints.updateJobStatus(id),
      data: {"status": status},
    );
  }
}
