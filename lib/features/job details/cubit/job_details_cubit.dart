import 'package:erp/core/helper_functions/flutter_toast.dart';
import 'package:erp/core/utils/easy_loading.dart';
import 'package:erp/features/job%20details/data/repo/job_details_repo.dart';
import 'package:erp/features/jobs/data/models/job_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'job_details_state.dart';

class JobDetailsCubit extends Cubit<JobDetailsState> {
  final JobDetailsRepo jobDetailsRepo;

  JobDetailsCubit(this.jobDetailsRepo) : super(JobDetailsInitial());

  JobModel? job;

  final List<String> statusOrder = [
    'PENDING',
    'ACCEPTED',
    'PICKED_UP',
    'DELIVERED',
  ];

  Future<void> getJobById(String id) async {
    emit(JobDetailsLoading());

    final result = await jobDetailsRepo.getJobDetails(id);
    result.when(
      success: (data) {
        job = data;
        emit(JobDetailsLoaded());
      },
      failure: (error) => emit(JobDetailsError(error.toString())),
    );
  }

  Future<void> updateJobStatus() async {
    showLoading();
    if (job == null) return;

    final currentStatus = job!.status ?? 'PENDING';
    final index = statusOrder.indexOf(currentStatus);

    if (index == -1 || index == statusOrder.length - 1) {
      emit(JobDetailsError("No further status updates available"));
      return;
    }

    final nextStatus = statusOrder[index + 1];

    final result = await jobDetailsRepo.updateJobStatus(job!.id, nextStatus);
    result.when(
        success: (updatedJob) {
          job = updatedJob;
          hideLoading();
          emit(JobStatusUpdated());
        },
        failure: (error) => {
              hideLoading(),
              customToast(msg: error.toString(), color:Colors.red),
              emit(JobDetailsError(error.toString())),
            });
  }

  Map<String, dynamic> statusStyle(String status) {
    switch (status.toUpperCase()) {
      case 'PENDING':
        return {
          "label": "Pending",
          "bgColor": Colors.orange.withValues(alpha: 0.15),
          "textColor": Colors.orange.shade700,
          "icon": Icons.access_time_filled,
        };
      case 'ACCEPTED':
        return {
          "label": "Accepted",
          "bgColor": Colors.blue.withValues(alpha: 0.15),
          "textColor": Colors.blue.shade600,
          "icon": Icons.check_circle_outline,
        };
      case 'PICKED_UP':
        return {
          "label": "Picked Up",
          "bgColor": Colors.amber.withValues(alpha: 0.15),
          "textColor": Colors.amber.shade700,
          "icon": Icons.local_shipping_outlined,
        };
      case 'DELIVERED':
        return {
          "label": "Delivered",
          "bgColor": Colors.green.withValues(alpha: 0.15),
          "textColor": Colors.green.shade700,
          "icon": Icons.done_all_rounded,
        };
      default:
        return {
          "label": "Unknown",
          "bgColor": Colors.grey.withValues(alpha: 0.15),
          "textColor": Colors.grey.shade600,
          "icon": Icons.help_outline,
        };
    }
  }

  String nextStatus(String current) {
    final index = statusOrder.indexOf(current);
    return index < statusOrder.length - 1
        ? statusOrder[index + 1].replaceAll('_', ' ')
        : 'Delivered';
  }
}
