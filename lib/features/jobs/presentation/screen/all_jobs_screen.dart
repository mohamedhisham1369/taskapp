import '../widgets/status_filter_chips.dart';
import 'package:erp/core/cache_helper/cache_helper.dart';
import 'package:erp/core/extensions/navigation_extension.dart';
import 'package:erp/core/routing/routes_name.dart';
import 'package:erp/core/themes/app_colors.dart';
import 'package:erp/core/utils/app_constants.dart';
import 'package:erp/features/jobs/cubit/jobs_cubit.dart';
import 'package:erp/features/jobs/presentation/widgets/job_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/error_widget_state.dart';
import '../widgets/jobs_skeleton_screen.dart';

class JobsScreen extends StatelessWidget {
  const JobsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<JobsCubit>();

    return BlocBuilder<JobsCubit, JobsState>(
      buildWhen: (previous, current) =>
          current is GetJobsLoading ||
          current is GetJobsSuccess ||
          current is GetJobsFailure,
      builder: (context, state) {
        if (state is GetJobsLoading) {
          return const JobsSkeletonScreen();
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text('Jobs'),
            actions: [
              IconButton(
                onPressed: () {
                  CacheHelper.clearAllSecuredData().then((v) {
                    AppConstants.userToken = null;
                    context.pushNamedAndRemoveUntil(Routes.loginScreen);
                  });
                },
                icon: Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          body: (state is GetJobsFailure)
              ? ErrorWidgetState(cubit: cubit)
              : RefreshIndicator(
                  onRefresh: () async {
                    cubit.getJobs();
                    cubit.isLast = false;
                  },
                  color: AppColors.primaryColor900,
                  child: Column(
                    children: [
                      StatusFilterChips(cubit: cubit),

                      Expanded(
                        child: ListView.separated(
                          controller: cubit.scrollController,
                          physics: const AlwaysScrollableScrollPhysics(),
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.sp, vertical: 12.sp),
                          itemCount: cubit.filteredJobs.length,
                          separatorBuilder: (_, __) => SizedBox(height: 12.sp),
                          itemBuilder: (context, index) {
                            final job = cubit.filteredJobs[index];
                            return JobItemWidget(job: job);
                          },
                        ),
                      ),
                      // Loading More Indicator
                      BlocBuilder<JobsCubit, JobsState>(
                        buildWhen: (previous, current) =>
                            current is GetJobsSuccess ||
                            current is GetJobsLoadingMore,
                        builder: (context, state) {
                          if (state is GetJobsLoadingMore) {
                            return const Padding(
                              padding: EdgeInsets.all(12),
                              child: Center(child: CircularProgressIndicator()),
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                      )
                    ],
                  ),
                ),
        );
      },
    );
  }
}


