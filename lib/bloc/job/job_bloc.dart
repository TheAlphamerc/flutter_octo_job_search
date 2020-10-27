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
    } else if (event is SearchJobBy) {
      yield* getJobs(event, description: event.description, isFullTime: event.isFullTime, location: event.location);
    } else if (event is SearchNextJobs) {
      var stat = state as LoadedJobsList;
      int page = event.isLoadNextJobs ? (stat.page ?? 1) + 1 : 1;
      yield* getNextJobs(event, page: page, description: event.description, isFullTime: event.isFullTime, location: event.location);
    }
  }

  Stream<JobState> getJobs(
    JobEvent event, {
    String description,
    String location,
    bool isFullTime,
  }) async* {
    try {
      yield OnJobLoading();
      final list = await event.repository.getJobs(page: 1, description: description, isFullTime: isFullTime, location: location);
      if (list != null) {
        print("Jobs getts data");
        yield LoadedJobsList(list, page: 1);
      }
    } catch (_, stackTrace) {
      developer.log('$_', name: 'getJobs', error: _, stackTrace: stackTrace);
      yield ErrorJobListState("Some error occured");
      yield state;
    }
  }

  Stream<JobState> getNextJobs(
    JobEvent event, {
    String description,
    String location,
    bool isFullTime,
    int page = 2,
  }) async* {
    var stat = state as LoadedJobsList;
    try {
      if(stat.loadingMore){
        print("Loading more..");
        return;
      }else if(!stat.hasMore){
         print("No jobs left");
          return;
      }
      yield OnNextJobLoading(stat.jobs,loadingMore:true,hasMore:stat.hasMore);
      final list = await event.repository.getJobs(page: page, description: description, isFullTime: isFullTime, location: location);
      if (!(list != null && list.isNotEmpty)) {
        print("No jobs left");
        yield LoadedJobsList(stat.jobs, page: page, hasMore: false);
        return;
      } else {
        var newList = List<JobModel>.from(stat.jobs,growable: true);
        newList.addAll(stat.jobs);
        yield LoadedJobsList(newList, page: page,loadingMore:false);
        return;
      }
    } catch (_, stackTrace) {
      developer.log('$_', name: 'getNextJobs', error: _, stackTrace: stackTrace);
      yield ErrorNextJobListState("Some error occured",stat.jobs,loadingMore:false,hasMore:stat.hasMore);
      yield state;
    }
  }
}
