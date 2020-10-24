part of 'job_bloc.dart';

abstract class JobEvent extends Equatable {
  final Repository repository = Repository(GetIt.instance<ApiGateway>());
  @override
  List<Object> get props => [];
}

class LoadJobsList extends JobEvent {}
