import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'job_event.dart';
part 'job_state.dart';

class JobBloc extends Bloc<JobEvent, JobState> {
  JobBloc() : super(JobInitial());

  @override
  Stream<JobState> mapEventToState(
    JobEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
