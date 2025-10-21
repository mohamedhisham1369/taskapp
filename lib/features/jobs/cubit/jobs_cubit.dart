// import 'package:erp/features/jobs/data/models/job_model.dart';
// import 'package:erp/features/jobs/data/repos/all_jobs_repo.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// part 'jobs_state.dart';

// class JobsCubit extends Cubit<JobsState> {
//   JobsCubit(this._jobsRepo) : super(JobsInitial());

//   final JobsRepo _jobsRepo;

//   List<JobModel> jobs = [];
//   int currentPage = 1;
//   bool isLoadingMore = false;

//   final ScrollController scrollController = ScrollController();

//   void setupScrollListener() {
//     scrollController.addListener(() {
//       if (scrollController.position.pixels >=
//               scrollController.position.maxScrollExtent - 100 &&
//           !isLoadingMore) {
//         loadMoreJobs();
//       }
//     });
//   }

//   Future<void> getJobs({int limit = 10}) async {
//     emit(GetJobsLoading());
//     currentPage = 1;

//     final result = await _jobsRepo.getJobs(page: currentPage, limit: limit);

//     result.when(
//       success: (data) {
//         jobs = data;

//         emit(GetJobsSuccess());
//       },
//       failure: (error) {
//         emit(GetJobsFailure());
//       },
//     );
//   }

//   bool isLast = false;
//   Future<void> loadMoreJobs({int limit = 10}) async {
//     if (!isLast) {
//       if (isLoadingMore) return;
//       isLoadingMore = true;

//       emit(GetJobsLoadingMore());

//       final result =
//           await _jobsRepo.getJobs(page: currentPage + 1, limit: limit);

//       result.when(
//         success: (data) {
//           if (data.isEmpty) {
//             isLast = true;
//           } else {
//             jobs.addAll(data);
//             currentPage++;
//           }
//           emit(GetJobsSuccess());
//         },
//         failure: (error) {
//           emit(GetJobsFailure());
//         },
//       );

//       isLoadingMore = false;
//     }
//   }

//   @override
//   Future<void> close() {
//     scrollController.dispose();
//     return super.close();
//   }
// }

import 'package:erp/features/jobs/data/models/job_model.dart';
import 'package:erp/features/jobs/data/repos/all_jobs_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'jobs_state.dart';

class JobsCubit extends Cubit<JobsState> {
  JobsCubit(this._jobsRepo) : super(JobsInitial());

  final JobsRepo _jobsRepo;

  List<JobModel> jobs = [];
  List<JobModel> filteredJobs = [];
  int currentPage = 1;
  bool isLoadingMore = false;
  String? selectedStatus; // Add this for filtering

  final ScrollController scrollController = ScrollController();

  void setupScrollListener() {
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent - 100 &&
          !isLoadingMore) {
        loadMoreJobs();
      }
    });
  }

  // Add status filter method
  void filterByStatus(String? status) {
    selectedStatus = status;

    if (status == null || status.isEmpty) {
      // Show all jobs if no filter selected
      filteredJobs = List.from(jobs);
    } else {
      // Filter jobs by status
      filteredJobs = jobs.where((job) => job.status == status).toList();
    }

    emit(GetJobsSuccess()); // Re-emit state to update UI
  }

  // Get unique statuses for filter dropdown
  List<String> getUniqueStatuses() {
    final statuses = jobs.map((job) => job.status ?? '').toSet().toList();
    statuses.removeWhere((status) => status.isEmpty);
    statuses.sort();
    return statuses;
  }

  Future<void> getJobs({int limit = 10}) async {
    emit(GetJobsLoading());
    currentPage = 1;
    selectedStatus = null; // Reset filter when refreshing

    final result = await _jobsRepo.getJobs(page: currentPage, limit: limit);

    result.when(
      success: (data) {
        jobs = data;
        filteredJobs = List.from(jobs); // Initialize filtered list
        emit(GetJobsSuccess());
      },
      failure: (error) {
        emit(GetJobsFailure());
      },
    );
  }

  bool isLast = false;
  Future<void> loadMoreJobs({int limit = 10}) async {
    if (!isLast) {
      if (isLoadingMore) return;
      isLoadingMore = true;

      emit(GetJobsLoadingMore());

      final result =
          await _jobsRepo.getJobs(page: currentPage + 1, limit: limit);

      result.when(
        success: (data) {
          if (data.isEmpty) {
            isLast = true;
          } else {
            jobs.addAll(data);

            // Apply current filter to new data
            if (selectedStatus == null || selectedStatus!.isEmpty) {
              filteredJobs = List.from(jobs);
            } else {
              filteredJobs =
                  jobs.where((job) => job.status == selectedStatus).toList();
            }

            currentPage++;
          }
          emit(GetJobsSuccess());
        },
        failure: (error) {
          emit(GetJobsFailure());
        },
      );

      isLoadingMore = false;
    }
  }

  void updateJobInList(JobModel updatedJob) {
    final index = jobs.indexWhere((job) => job.id == updatedJob.id);
    if (index != -1) {
      jobs[index] = updatedJob;

      // Also update filteredJobs if the job exists there
      final filteredIndex =
          filteredJobs.indexWhere((job) => job.id == updatedJob.id);
      if (filteredIndex != -1) {
        filteredJobs[filteredIndex] = updatedJob;
      }

      emit(GetJobsSuccess()); // Rebuild the UI
    }
  }

  @override
  Future<void> close() {
    scrollController.dispose();
    return super.close();
  }
}
