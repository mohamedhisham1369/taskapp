
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:erp/core/themes/app_colors.dart';
import 'package:erp/features/job%20details/cubit/job_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdatingWidget extends StatelessWidget {
  const UpdatingWidget({
    super.key,
    required this.cubit,
  });

  final JobDetailsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ConnectivityResult>>(
      future: Connectivity().checkConnectivity(),
      builder: (context, futureSnapshot) {
        final initialConnectivity =
            futureSnapshot.data ?? [ConnectivityResult.none];
        final initialHasInternet = initialConnectivity.any((result) =>
            result == ConnectivityResult.wifi ||
            result == ConnectivityResult.mobile ||
            result == ConnectivityResult.ethernet ||
            result == ConnectivityResult.vpn);

        return StreamBuilder<List<ConnectivityResult>>(
          stream: Connectivity().onConnectivityChanged,
          initialData: initialConnectivity,
          builder: (context, streamSnapshot) {
            final connectivityResults =
                streamSnapshot.data ?? initialConnectivity;
            final hasInternet = connectivityResults.any((result) =>
                result == ConnectivityResult.wifi ||
                result == ConnectivityResult.mobile ||
                result == ConnectivityResult.ethernet ||
                result == ConnectivityResult.vpn);

            // If no internet, don't show the button
            if (!hasInternet) {
              return const SizedBox();
            }

            return BlocConsumer<JobDetailsCubit, JobDetailsState>(
              listenWhen: (prev, curr) =>
                  curr is JobDetailsError || curr is JobStatusUpdated,
              listener: (context, state) {
                if (state is JobStatusUpdated) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('✅ Status updated successfully!'),
                      backgroundColor: Colors.green,
                    ),
                  );
                } else if (state is JobDetailsError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('❌ ${state.message}'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              buildWhen: (prev, curr) =>
                  curr is JobStatusUpdating || curr is JobStatusUpdated,
              builder: (context, state) {
                final isUpdating = state is JobStatusUpdating;

                final job = cubit.job; // ✅ always get latest job

                return job?.status != 'DELIVERED'
                    ? Center(
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor900,
                            minimumSize: Size(200.sp, 45.sp),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                          ),
                          onPressed:
                              isUpdating ? null : () => cubit.updateJobStatus(),
                          icon: isUpdating
                              ? const SizedBox(
                                  width: 18,
                                  height: 18,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                )
                              : const Icon(Icons.sync_rounded,
                                  color: Colors.white),
                          label: Text(
                            isUpdating
                                ? 'Updating...'
                                : 'Mark as ${cubit.nextStatus(job?.status ?? 'PENDING')}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          ),
                        ),
                      )
                    : const SizedBox();
              },
            );
          },
        );
      },
    );
  }
}
