import 'package:dio/dio.dart';
import 'package:flutter_octo_job_search/helper/config.dart';
import 'package:flutter_octo_job_search/resources/dio_client.dart';
import 'package:flutter_octo_job_search/resources/gatway/api_gateway.dart';
import 'package:flutter_octo_job_search/resources/gatway/api_gateway_impl.dart';
import 'package:get_it/get_it.dart';

void setUpDependency() {
  final serviceLocator = GetIt.instance;

  serviceLocator.registerLazySingleton<ApiGateway>(
    () => ApiGatewayImpl(
      DioClient(Dio(), baseEndpoint: Config.apiBaseUrl, logging: true),
    ),
  );
}
