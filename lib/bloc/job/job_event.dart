part of 'job_bloc.dart';

abstract class JobEvent extends Equatable {
  final Repository repository = Repository(GetIt.instance<ApiGateway>());
  @override
  List<Object> get props => [];
}

class LoadJobsList extends JobEvent {}

class SearchJobBy extends JobEvent {
  final String description;
  final bool isFullTime;
  final String location;
  final bool isLoadNextJobs;
  SearchJobBy(this.description, this.isFullTime, this.location,{this.isLoadNextJobs = false});
}

class SearchNextJobs extends JobEvent {
  final String description;
  final bool isFullTime;
  final String location;
  final bool isLoadNextJobs;
  SearchNextJobs(this.description, this.isFullTime, this.location,{this.isLoadNextJobs = false});
}
