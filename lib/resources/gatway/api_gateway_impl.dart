import 'package:flutter_octo_job_search/bloc/job/job_model.dart';
import 'package:flutter_octo_job_search/helper/config.dart';
import 'package:flutter_octo_job_search/resources/dio_client.dart';
import 'package:flutter_octo_job_search/resources/gatway/api_gateway.dart';

class ApiGatewayImpl implements ApiGateway {
  final DioClient _dioClient;

  ApiGatewayImpl(this._dioClient);

  @override
  Future<List<JobModel>> getJobs({String description, String location, bool isFullTime, int page}) async {
    try {
      String url = Config.all;
      if(description != null || location != null || isFullTime != null){
        url = Config.filerJob(pageNo:page,description: description,location:location,isFullTime:isFullTime,);
      }

      var response = await _dioClient.get(url);
      List<JobModel> list = [];
      list = _dioClient.getJsonBodyList(response).map((value) {
        return JobModel.fromJson(value);
      }).toList();
      print(list.length);
      return list;
    } catch (error) {
      throw error;
    }
  }
}
