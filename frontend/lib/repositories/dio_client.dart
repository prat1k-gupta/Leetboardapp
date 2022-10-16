import 'dart:developer';
import 'package:dio/dio.dart';

class DioClient {
  late Dio _dio;

  final baseUrl = "https://leetcode-userinfo-api.herokuapp.com/";

  DioClient() {
    _dio = Dio(BaseOptions(baseUrl: baseUrl));
    // initializeInterceptors();
  }

  Future<Response> getRequest(String endPoint) async {
    Response response;
    try {
      response = await _dio.get(endPoint);
    } on DioError catch (e) {
      log(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  Future<Response> sendRequest(
      String endPoint, Map<String, dynamic> body) async {
    Response response;
    try {
      response = await _dio.post(endPoint,
          data: body,
          options: Options(headers: {
            "Content-type": "application/json",
          }));

    } 
    on DioError catch (e) {
      log(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  // Interceptores are the callbacks that help in handling the errors
  iniliazeInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(
      onError: (e, handler) {
        log(e.message);
      },
      onRequest: (options, handler) {
        log(options.baseUrl);
        log("${options.method.toString()}  ${options.path}");
      },
      onResponse: (response, handler) {
        log(response.data);
      },
    ));
  }
}
