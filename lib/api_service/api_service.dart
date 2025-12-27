import 'package:dio/dio.dart';

class ApiService {
  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;

  late Dio dio;

  ApiService._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: "http://10.0.2.2:8000/api",
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        headers: {"Accept": "application/json"},
      ),
    );

    dio.interceptors.add(LogInterceptor(
      request: true,
      responseBody: true,
      requestBody: true,
    ));
  }


}
