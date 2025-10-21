import 'package:easy_localization/easy_localization.dart';

class AppValidator {
  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '${fieldName?.tr()} validation.required'.tr();
    }
    return null;
  }

  static String? validateUsername(String? username) {
    if (username == null || username.isEmpty) {
      return 'validation.username.required'.tr();
    }

    const pattern = r"^[a-zA-Z0-9_-]{3,20}$";
    final regex = RegExp(pattern);

    if (!regex.hasMatch(username)) {
      return 'validation.username.invalid'.tr();
    }

    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'validation.email.required'.tr();
    }

    final emailRegExp = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'validation.email.invalid'.tr();
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'validation.password.required'.tr();
    }

    if (value.length < 6) {
      return 'validation.password.minLength'.tr();
    }

    return null;
  }

  static String? validateConfirmPassword(
      String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'validation.confirmPassword.required'.tr();
    }

    if (password != confirmPassword) {
      return 'validation.confirmPassword.mismatch'.tr();
    }

    return null;
  }

  static String? validateSaudiPhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'validation.phone.required'.tr();
    }

    // final phoneRegExp = RegExp(r'^[0-9]{9}$');
    // if (!phoneRegExp.hasMatch(value)) {
    //   return 'validation.phone.invalid'.tr();
    // }

    return null;
  }

  static String? validateOTP(String? value) {
    if (value == null || value.isEmpty) {
      return 'validation.otp.required'.tr();
    }

    if (!RegExp(r'^\d{6}$').hasMatch(value)) {
      return 'validation.otp.invalid'.tr();
    }

    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'validation.phone.required'.tr();
    }

    return null;
  }

  static String? validateRequired(String? value) {
    if (value == null || value.isEmpty) {
      return 'validation.required'.tr();
    }
    return null;
  }

  static String? validateUrl(String? value) {
    if (value == null || value.isEmpty) {
      return 'validation.url.required'.tr();
    }

    final urlRegExp = RegExp(r'^(https?|ftp):\/\/[^\s/$.?#].[^\s]*$');
    if (!urlRegExp.hasMatch(value)) {
      return 'validation.url.invalid'.tr();
    }

    return null;
  }

  static String? validateNotEmpty(String? value, {required String fieldName}) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName cannot be empty';
    }
    return null;
  }

  static String? validateOptionalText(String? value) {
    if (value != null && value.length > 500) {
      return 'Notes can\'t exceed 500 characters';
    }
    return null;
  }
}
