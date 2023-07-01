import 'package:flutter_test_assignment/model/facts_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api_client.g.dart';

@RestApi(
  baseUrl: 'https://cat-fact.herokuapp.com',
)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("/facts/random")
  Future<Facts> getFacts();
}
