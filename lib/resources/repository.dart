import 'package:flutter_octo_job_search/bloc/job/job_model.dart';
import 'package:flutter_octo_job_search/resources/gatway/api_gateway.dart';

class Repository{
   final ApiGateway apiGatway;

  Repository(this.apiGatway);

  Future<List<JobModel>> getJobs(){
    return apiGatway.getJobs();
  }
}