import 'package:erp/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: AppColors.primaryColor900,
        ),
      ),
    );
  }
}
