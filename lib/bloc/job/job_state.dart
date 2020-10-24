part of 'job_bloc.dart';

abstract class JobState extends Equatable {
  const JobState();
  
  @override
  List<Object> get props => [];
}

class OnJobLoading extends JobState {}
class LoadedJobsList extends JobState {
  final List<JobModel> jobs;

  LoadedJobsList(this.jobs);
}

class ErrorJobListState extends JobState {
  final String errorMessage;

  ErrorJobListState(this.errorMessage);

  @override
  String toString() => 'ErrorJobListState';
}