import 'package:flutter_octo_job_search/bloc/job/job_model.dart';
import 'package:flutter_octo_job_search/resources/gatway/api_gateway.dart';

class Repository{
   final ApiGateway apiGatway;

  Repository(this.apiGatway);

  Future<List<JobModel>> getJobs({String description, String location, bool isFullTime,int page}){
    return apiGatway.getJobs(description:description,location:location,isFullTime:isFullTime,page:page);
  }
}