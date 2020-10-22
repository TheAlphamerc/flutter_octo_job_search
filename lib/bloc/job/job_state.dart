part of 'job_bloc.dart';

abstract class JobState extends Equatable {
  const JobState();
  
  @override
  List<Object> get props => [];
}

class JobInitial extends JobState {}
