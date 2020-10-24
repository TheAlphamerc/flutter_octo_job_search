import 'package:flutter_octo_job_search/bloc/job/job_model.dart';
import 'package:flutter_octo_job_search/helper/config.dart';
import 'package:flutter_octo_job_search/resources/dio_client.dart';
import 'package:flutter_octo_job_search/resources/gatway/api_gateway.dart';

class ApiGatewayImpl implements ApiGateway {
  final DioClient _dioClient;

  ApiGatewayImpl(this._dioClient);

  @override
  Future<List<JobModel>> getJobs() async {
    try {
      var response = await _dioClient.get(Config.all);
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
