part of 'jobs_cubit.dart';

sealed class JobsState {}

final class JobsInitial extends JobsState {}

class GetJobsLoading extends JobsState {}

class GetJobsSuccess extends JobsState {}

class GetJobsFailure extends JobsState {

}

class GetJobsLoadingMore extends JobsState {}
