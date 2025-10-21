import 'package:erp/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDividerWidget extends StatelessWidget {
  const CustomDividerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.h,
      width: double.infinity,
      color: AppColors.neutralColor600,
    );
  }
}
