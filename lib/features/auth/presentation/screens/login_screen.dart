import 'package:easy_localization/easy_localization.dart';
import 'package:erp/core/extensions/navigation_extension.dart';
import 'package:erp/core/routing/routes_name.dart';
import 'package:erp/core/themes/app_colors.dart';
import 'package:erp/core/themes/text_colors.dart';
import 'package:erp/core/widgets/custom_button_widget.dart';
import 'package:erp/features/auth/business_logic/auth_cubit.dart';
import 'package:erp/features/auth/presentation/widgets/login_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // hideLoading();
    final loginCubit = context.read<AuthCubit>();

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 63.h),
          24.verticalSpace,
          CircleAvatar(
            radius: 60,
            child: Icon(
              Icons.badge,
              size: 50.sp,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'auth.welcome'.tr(),
                style: Styles.heading1.copyWith(
                  color: AppColors.neutralColor1600,
                ),
              ),
              2.horizontalSpace,
              Text(
                'auth.back'.tr(),
                style: Styles.heading1.copyWith(
                  color: AppColors.primaryColor900,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.sp),
            child: Text(
              textAlign: TextAlign.center,
              'auth.pleaseEnterYourEmail'.tr(),
              style: Styles.heading5.copyWith(
                color: AppColors.neutralColor600,
              ),
            ),
          ),
          SizedBox(height: 50.h),
          const LoginFormWidget(),
          BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                context.pushNamedAndRemoveUntil(Routes.jobsScreen);
              }
            },
            child: Padding(
              padding: EdgeInsets.all(20.0.sp),
              child: CustomButtonWidget(
                text: 'auth.login'.tr(),
                width: double.infinity,
                elevation: 0,
                onPressed: () {
                  if (loginCubit.formKey.currentState!.validate()) {
                    context.read<AuthCubit>().userLogin();
                  }
                },
              ),
            ),
          )
        ],
      ),
    ));
  }
}
