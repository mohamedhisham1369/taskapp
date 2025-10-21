part of 'job_details_cubit.dart';

abstract class JobDetailsState {}

class JobDetailsInitial extends JobDetailsState {}

class JobDetailsLoading extends JobDetailsState {}

class JobDetailsLoaded extends JobDetailsState {}

class JobStatusUpdating extends JobDetailsState {}

class JobStatusUpdated extends JobDetailsState {}

class JobDetailsError extends JobDetailsState {
  final String message;
  JobDetailsError(this.message);
}
  



   



      
      