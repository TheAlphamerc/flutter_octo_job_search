import 'dart:async';
import 'dart:developer' as developer;
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_octo_job_search/bloc/job/job_model.dart';
import 'package:flutter_octo_job_search/resources/gatway/api_gateway.dart';
import 'package:flutter_octo_job_search/resources/repository.dart';
import 'package:get_it/get_it.dart';

part 'job_event.dart';
part 'job_state.dart';

class JobBloc extends Bloc<JobEvent, JobState> {
  JobBloc() : super(OnJobLoading());

  @override
  Stream<JobState> mapEventToState(
    JobEvent event,
  ) async* {
    if (event is LoadJobsList) {
      yield* getJobs(event);
    }
  }

  Stream<JobState> getJobs(JobEvent event) async* {
    try {
      yield OnJobLoading();
      final list = await event.repository.getJobs();
      if(list != null){
        print("Jobs getts data");
        yield LoadedJobsList(list);
      }
    } catch (_, stackTrace) {
      developer.log('$_', name: 'CommitBloc', error: _, stackTrace: stackTrace);
      yield ErrorJobListState("Some error occured");
      yield state;
    }
  }
}
