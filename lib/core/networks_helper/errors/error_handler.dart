import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:erp/core/networks_helper/errors/failure.dart';

class ErrorHandler {
  static FailureException handleApiError(Response? response) {
    String message = "error.unknown".tr();
    if (response == null) {
      message = "error.noResponse".tr();
    } else if (response.statusCode == 401) {
      message = "error.sessionExpired".tr();
    } else if (response.statusCode == 500) {
      // navigateToServerErrorScreen();
      try {} catch (e) {
        // Crashlytics will ignore this safely
      }
      message = "error.serverError".tr();
    } else if (response.data != null && response.data is Map<String, dynamic>) {
      final responseMessage =
          response.data['message'] ?? response.data['error'];
      final errors = response.data['errors'];

      if (responseMessage == "error.wrongVerification".tr() &&
          errors is Map<String, dynamic>) {
        message = _mapValidationErrors(errors);
      } else {
        message = responseMessage ?? "error.unexpected".tr();
      }
    } else {
      message = "error.unexpectedResponse".tr();
    }
    try {} catch (e) {
      // Crashlytics will ignore this safely
    }
    _showToast(message, isError: true);
    return FailureException(errMessage: message);
  }

  static String _mapValidationErrors(Map<String, dynamic> errors) {
    return errors.values.map((value) => "- $value").join("\n");
  }

  static FailureException handleDioError(DioException e) {
    String errorMessage;

    switch (e.type) {
      case DioExceptionType.connectionError:
        errorMessage = "error.noConnection".tr();
        break;
      case DioExceptionType.sendTimeout:
        errorMessage = "error.requestTimeout".tr();
        break;
      case DioExceptionType.receiveTimeout:
        errorMessage = "error.serverTimeout".tr();
        break;
      case DioExceptionType.badResponse:
        return handleApiError(e.response);
      case DioExceptionType.cancel:
        errorMessage = "error.requestCancelled".tr();
        break;
      case DioExceptionType.unknown:
        errorMessage = "error.network".tr();
        break;
      default:
        errorMessage = "error.connection".tr();
    }

    _showToast(errorMessage, isError: true);
    return FailureException(errMessage: errorMessage);
  }

  static FailureException handleUnexpectedError(Object e) {
    String errorMessage = "${'error.unexpectedError'.tr()}${e.toString()}";
    _showToast(errorMessage, isError: true);
    return FailureException(errMessage: errorMessage);
  }

  static void _showToast(String message, {bool isError = false}) {}
}

// void navigateToServerErrorScreen() {
//   final context = AppConstants.navigatorKey.currentState?.context;
//   if (context != null) {
//     Navigator.pushAndRemoveUntil(
//       context,
//       MaterialPageRoute(builder: (context) => ServerErrorScreen()),
//       (route) => false,
//     );
//   }
// }
