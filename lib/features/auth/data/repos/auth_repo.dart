import 'package:dio/dio.dart';
import 'package:erp/core/cache_helper/cache_helper.dart';
import 'package:erp/core/cache_helper/cache_keys.dart';
import 'package:erp/core/helper_functions/flutter_toast.dart';
import 'package:erp/core/networks_helper/api_results/api_result.dart';
import 'package:erp/core/networks_helper/errors/exceptions.dart';
import 'package:erp/core/networks_helper/errors/failure.dart';
import 'package:erp/core/themes/app_colors.dart';
import 'package:erp/core/utils/app_constants.dart';
import 'package:erp/features/auth/data/api_services/api_services.dart';
import 'package:erp/features/auth/data/models/login_model.dart';

class AuthRepository {
  final AuthApiServices authApiServices;

  AuthRepository(this.authApiServices);

  /// Login
  Future<ApiResult<String>> userLogin({
    required String email,
    required String password,
  }) async {
    final response = await authApiServices.login(
      email: email,
      password: password,
    );
    try {
      if (response!.statusCode == 200 || response.statusCode == 201) {
        LoginModel loginModel = LoginModel.fromJson(response.data);
        await CacheHelper.saveSecuredString(
            key: CacheKeys.userToken, value: loginModel.token);

        AppConstants.userToken =
            await CacheHelper.getSecuredString(key: CacheKeys.userToken);
        customToast(msg: "Login Success", color: AppColors.greenColor200);
        return ApiResult.success('Login Success');
      } else {
        return ApiResult.failure(
          ServerException.fromResponse(response.statusCode, response),
        );
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
