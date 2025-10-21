import 'package:easy_localization/easy_localization.dart';
import 'package:erp/core/helper_functions/validation.dart';
import 'package:erp/core/themes/text_colors.dart';
import 'package:erp/core/utils/app_constants.dart';
import 'package:erp/core/widgets/custom_text_form_field_widget.dart';
import 'package:erp/features/auth/business_logic/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final loginCubit = context.read<AuthCubit>();

    return Form(
      key: loginCubit.formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'auth.email'.tr(),
              style: Styles.contentEmphasis,
            ),
            8.verticalSpace,
            CustomTextFormFieldWidget(
              controller: context.read<AuthCubit>().emailController,
              hintText: 'auth.enterYourEmail'.tr(),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              inputFormatters: [],
              validator: (e) {
                return AppValidator.validateEmail(e);
              },
              borderRadius: AppConstants.borderRadius,
            ),
            SizedBox(height: 20.h),
            Text(
              'auth.Password'.tr(),
              style: Styles.contentEmphasis,
            ),
            8.verticalSpace,
            BlocBuilder<AuthCubit, AuthState>(
              buildWhen: (previous, current) => current is TogglePasswordState,
              builder: (context, state) {
                return CustomTextFormFieldWidget(
                  controller: context.read<AuthCubit>().passwordController,
                  hintText: 'auth.enterYourPassword'.tr(),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: context.read<AuthCubit>().isObscure,
                  suffixIcon: IconButton(
                    onPressed: () => context.read<AuthCubit>().toggleObscure(),
                    icon: Icon(context.read<AuthCubit>().isObscure
                        ? Icons.visibility
                        : Icons.visibility_off),
                  ),
                  borderRadius: AppConstants.borderRadius,
                  validator: (value) => AppValidator.validatePassword(value),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
