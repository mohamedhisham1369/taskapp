import 'package:erp/features/job%20details/cubit/job_details_cubit.dart';
import 'package:erp/features/jobs/data/models/job_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../widgets/customer_info_card.dart';
import '../widgets/delivery_info_section.dart';
import '../widgets/items_section.dart';
import '../widgets/status_progress_row.dart';
import '../widgets/updating_widget.dart';

class JobDetailsScreen extends StatelessWidget {
  const JobDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<JobDetailsCubit>();
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop(context.read<JobDetailsCubit>().job);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: BlocBuilder<JobDetailsCubit, JobDetailsState>(
            buildWhen: (prev, curr) =>
                curr is JobDetailsLoaded || curr is JobDetailsLoading,
            builder: (context, state) {
              final job = cubit.job;
              return Text(
                job?.code ?? "Job Details",
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              );
            },
          ),
          leading: BackButton(
            onPressed: () {
              Navigator.of(context).pop(cubit.job);
            },
          ),
        ),
        body: BlocBuilder<JobDetailsCubit, JobDetailsState>(
          buildWhen: (prev, curr) =>
              curr is JobDetailsLoaded || curr is JobDetailsLoading,
          builder: (context, state) {
            final isLoading = state is JobDetailsLoading;
            final job = cubit.job ??
                JobModel(
                  id: '0',
                  code: 'Loading...',
                  customerName: 'Loading...',
                  address: 'Loading...',
                  status: 'PENDING',
                  truckType: 'Loading...',
                  eta: '',
                  notes: '',
                  price: 0,
                  items: List.generate(
                    3,
                    (i) => ItemModel(name: 'Loading item $i', qty: i + 1),
                  ),
                );

            final currentIndex =
                cubit.statusOrder.indexOf(job.status ?? 'PENDING').clamp(0, 3);

            return Skeletonizer(
              enabled: isLoading,
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomerInfoCard(job: job),
                    SizedBox(height: 20.sp),
                    const Text('Status Progress',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 16)),
                    SizedBox(height: 10.sp),
                    BlocBuilder<JobDetailsCubit, JobDetailsState>(
                      buildWhen: (prev, curr) =>
                          curr is JobStatusUpdating ||
                          curr is JobStatusUpdated ||
                          curr is JobDetailsLoaded,
                      builder: (context, state) {
                        final currentIndex = cubit.statusOrder
                            .indexOf(cubit.job?.status ?? 'PENDING')
                            .clamp(0, 3);
                        return StatusProgressRow(
                          statusOrder: cubit.statusOrder,
                          currentIndex: currentIndex,
                        );
                      },
                    ),
                    SizedBox(height: 20.sp),
                    DeliveryInfoSection(job: job),
                    SizedBox(height: 16.sp),
                    ItemsSection(job: job),
                    SizedBox(height: 30.sp),
                    UpdatingWidget(cubit: cubit),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
