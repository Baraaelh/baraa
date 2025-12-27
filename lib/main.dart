import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/api_service/api_service.dart';
import 'package:project/app/core/initial_binding.dart';
import 'package:project/app/modules/auth/Cart/Cart_Controller.dart';
import 'package:project/app/modules/auth/Widget/main_layout_controller.dart';
import 'package:project/app/modules/auth/select_role/select_role_view.dart';
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
      title: "Pharmacy App",
     
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Cairo', // يفضل استخدام خط يدعم العربية بشكل جيد
      ),
      initialBinding: InitialBinding(),
      initialRoute: AppRoutes.login,
      getPages: AppPages.pages,
      debugShowCheckedModeBanner: false,
    );
  }
}
