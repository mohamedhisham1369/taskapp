import 'dart:math';

import 'package:dio/dio.dart';
import 'package:erp/core/networks_helper/dio_helper/dio_helper.dart';
import 'package:erp/core/networks_helper/dio_helper/end_points.dart';

class AuthApiServices {
  AuthApiServices(this._dioFactory);
  final DioHelper _dioFactory;

  Future<Response?> login({
    required String email,
    required String password,
  }) async {
    return _dioFactory.post(
      endPoint: EndPoints.login,
      data: {
        'email': email,
        'password': password,
        'token': List.generate(
            32,
            (i) =>
                'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'[
                    Random().nextInt(62)]).join(),
      },
    );
  }
}
