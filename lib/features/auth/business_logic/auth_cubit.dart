import 'dart:async';

import 'package:erp/core/utils/easy_loading.dart';
import 'package:erp/features/auth/data/repos/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepository) : super(AuthInitial());

  final AuthRepository authRepository;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isObscure = true;
  bool isObscure2 = true;

  final formKey = GlobalKey<FormState>();

  /// Toggle Password
  void toggleObscure() {
    isObscure = !isObscure;
    emit(TogglePasswordState());
  }

  void toggleObscure2() {
    isObscure2 = !isObscure2;
    emit(TogglePasswordState());
  }

  Future userLogin() async {
    showLoading();
    emit(LoginLoading());
    final result = await authRepository.userLogin(
      email: emailController.text,
      password: passwordController.text,
    );
    result.when(success: (success) {
      hideLoading();

      emit(LoginSuccess());
    }, failure: (error) {
      hideLoading();
      emit(LoginError());
    });
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();

    return super.close();
  }
}
