part of 'job_bloc.dart';

abstract class JobState extends Equatable {
  const JobState();
  
  @override
  List<Object> get props => [];
}

class OnJobLoading extends JobState {}
class LoadedJobsList extends JobState {
  final List<JobModel> jobs;
  final int page;
  final String description;
  final String location;
  final bool isFullTime;

  LoadedJobsList(this.jobs, {this.isFullTime,this.page, this.description, this.location});
}

class ErrorJobListState extends JobState {
  final String errorMessage;

  ErrorJobListState(this.errorMessage);

  @override
  String toString() => 'ErrorJobListState';
}
class OnNextJobLoading extends LoadedJobsList {
  OnNextJobLoading(List<JobModel> jobs) : super(jobs);
}
class ErrorNextJobListState extends LoadedJobsList {
  final String errorMessage;

  ErrorNextJobListState(this.errorMessage,List<JobModel> jobs): super(jobs);

  @override
  String toString() => 'ErrorJobListState';
}