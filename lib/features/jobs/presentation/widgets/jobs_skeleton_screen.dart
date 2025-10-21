import 'package:erp/features/jobs/cubit/jobs_cubit.dart';
import 'package:erp/features/jobs/data/models/job_model.dart';
import 'package:erp/features/jobs/presentation/widgets/job_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class JobsSkeletonScreen extends StatelessWidget {
  const JobsSkeletonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<JobsCubit>();
    final jobs = List.generate(
      8,
      (index) => JobModel(
        id: '$index',
        code: '',
        customerName: 'Loading...',
        address: 'Loading...',
        price: 0,
        status: 'Loading...',
        createdAt: '',
      ),
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        title: const Text(
          'Jobs',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Skeletonizer(
        enabled: true,
        child: ListView.separated(
          controller: cubit.scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 12.sp),
          itemCount: jobs.length,
          separatorBuilder: (_, __) => SizedBox(height: 12.sp),
          itemBuilder: (context, index) {
            return JobItemWidget(job: jobs[index]);
          },
        ),
      ),
    );
  }
}
