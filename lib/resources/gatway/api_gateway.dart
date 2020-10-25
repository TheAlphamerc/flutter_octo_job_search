import 'package:flutter_octo_job_search/bloc/job/job_model.dart';

abstract class ApiGateway {
  Future<List<JobModel>> getJobs({String description, String location, bool isFullTime,int page});
}