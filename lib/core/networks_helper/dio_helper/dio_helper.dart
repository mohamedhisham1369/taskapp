import 'package:dio/dio.dart';
import 'package:erp/core/cache_helper/cache_helper.dart';
import 'package:erp/core/cache_helper/cache_keys.dart';
import 'package:erp/core/networks_helper/dio_helper/end_points.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  static Dio dio = Dio();

  static Future<void> init() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: EndPoints.baseUrl,
      receiveDataWhenStatusError: true,
      validateStatus: (status) =>
          true, // Accept all responses for manual handling
    );

    dio = Dio(baseOptions);
    addDioInterceptor();
    return Future.value();
  }

  Future<Response?> get({required String endPoint, data}) async {
    dio.options.headers = {
      "Accept": "application/json",
      "Lang": CacheHelper.getCurrentLanguage().toString(),
      "Authorization":
          "Bearer ${await CacheHelper.getSecuredString(key: CacheKeys.userToken)}",
    };
    return await dio.get(endPoint, queryParameters: data);
  }

  Future<Response?> patch({required String endPoint, data}) async {
    dio.options.headers = {
      "Accept": "application/json",
      "Lang": CacheHelper.getCurrentLanguage().toString(),
      "Authorization":
          "Bearer ${await CacheHelper.getSecuredString(key: CacheKeys.userToken)}",
    };
    return await dio.patch(endPoint, queryParameters: data);
  }

  Future<Response?> post({required String endPoint, data}) async {
    dio.options.headers = {
      "Accept": "application/json",
      "Lang": CacheHelper.getCurrentLanguage().toString(),
      "Authorization":
          "Bearer ${await CacheHelper.getSecuredString(key: CacheKeys.userToken)}",
    };
    return await dio.post(endPoint, data: data);
  }


  Future<Response?> put({required String endPoint, data}) async {
    dio.options.headers = {
      "Accept": "application/json",
      "Lang": CacheHelper.getCurrentLanguage().toString(),
      "Authorization":
          "Bearer ${await CacheHelper.getSecuredString(key: CacheKeys.userToken)}",
    };
    return await dio.put(endPoint, data: data);
  }
  static void addDioInterceptor() {
    dio.interceptors.addAll([
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
        responseBody: true,
      ),
    ]);
  }
}
