import 'package:dio/dio.dart';
import 'package:erp/core/networks_helper/dio_helper/dio_helper.dart';
import 'package:erp/core/networks_helper/dio_helper/end_points.dart';

class JobDetailsApiServices {
  final DioHelper _dio;

  JobDetailsApiServices(this._dio);

  /// 🔹 Get single job details
  Future<Response?> getJobDetails(String id) async {
    return _dio.get(endPoint: EndPoints.jobDetails(id));
  }

  /// 🔹 Update job status
  Future<Response?> updateJobStatus(String id, String status) async {
    return _dio.put(
      endPoint: EndPoints.updateJobStatus(id),
      data: {"status": status},
    );
  }
}
