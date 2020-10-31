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
  final bool hasMore;
  final bool loadingMore;

  bool get isNotNullEmpty => jobs != null && jobs.isEmpty;

  LoadedJobsList(this.jobs, {this.isFullTime,this.page, this.description, this.location,this.hasMore = true, this.loadingMore = false,});
}

class ErrorJobListState extends JobState {
  final String errorMessage;

  ErrorJobListState(this.errorMessage);

  @override
  String toString() => 'ErrorJobListState';
}
class OnNextJobLoading extends LoadedJobsList {
  OnNextJobLoading(List<JobModel> jobs,{bool loadingMore, bool hasMore}) : super(jobs,loadingMore:loadingMore,hasMore:hasMore);
}
class ErrorNextJobListState extends LoadedJobsList {
  final String errorMessage;

  ErrorNextJobListState(this.errorMessage,List<JobModel> jobs,{bool loadingMore,int page,bool hasMore}): super(jobs,loadingMore:loadingMore,page:page,hasMore:hasMore);

  @override
  String toString() => 'ErrorJobListState';
}