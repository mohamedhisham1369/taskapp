import 'package:erp/core/widgets/custom_button_widget.dart';
import 'package:erp/features/jobs/cubit/jobs_cubit.dart';
import 'package:flutter/material.dart';

class ErrorWidgetState extends StatelessWidget {
  const ErrorWidgetState({super.key, required this.cubit});
  final JobsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, color: Colors.redAccent, size: 45),
          const SizedBox(height: 15),
          const Text(
            "Something went wrong",
            style: TextStyle(
              color: Colors.redAccent,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15),
          CustomButtonWidget(
            onPressed: () => cubit.getJobs(),
            text: 'Retry',
          ),
        ],
      ),
    );
  }
}
