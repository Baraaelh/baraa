import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/api_service/api_service.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';
//import 'services/api_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Dio API Service
 // ApiService._instance.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.login,  // أول صفحة
      getPages: AppPages.pages,        // كل الراوتس
    );
  }
}
