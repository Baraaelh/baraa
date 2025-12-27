// // lib/app/data/repositories/auth_repository.dart

// import 'package:project/app/data/models/login_request_model.dart';
// import 'package:project/app/data/models/register_request_model.dart';
// import 'package:project/app/data/providers/api_provider.dart';
// import 'package:dio/dio.dart';

// class AuthRepository {
//   final Dio _dio = ApiProvider.dio;

//   // تسجيل دخول
//   Future<Response> login(LoginRequestModel request) async {
//     return await _dio.post("/login", data: request.toJson());
//   }

//   // تسجيل حساب جديد
//   Future<Response> register(RegisterRequestModel request) async {
//     return await _dio.post("/register", data: request.toJson());
//   }
// }
