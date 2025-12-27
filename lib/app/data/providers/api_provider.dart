// lib/app/data/providers/api_provider.dart

// import 'package:dio/dio.dart';

// class ApiProvider {
//   static final Dio _dio = Dio(
//     BaseOptions(
//       baseUrl: "https://api.example.com",
//       connectTimeout: const Duration(seconds: 10),
//       receiveTimeout: const Duration(seconds: 10),
//       headers: {
//         "Accept": "application/json",
//       },
//     ),
//   );

//   static Dio get dio => _dio;
// }


// lib/app/data/providers/api_provider.dart

import 'package:dio/dio.dart';

class ApiProvider {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://your-api-url.com/api",
      connectTimeout: Duration(seconds: 20),
      receiveTimeout: Duration(seconds: 20),
      headers: {"Accept": "application/json"},
    ),
  );

   Future<Response> getProducts() {
    return dio.get('/products');
  }
}
