import 'package:flutter_test_assignment/api/api_client.dart';
import 'package:dio/dio.dart';

class ApiHelper {
  static ApiClient getClient() {
    final dio = Dio(
      BaseOptions(
        contentType: 'application/json;charset=utf-8',
      ),
    );

    return ApiClient(dio);
  }
}
