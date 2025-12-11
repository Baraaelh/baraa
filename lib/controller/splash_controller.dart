import 'package:get/get.dart';
import 'package:project/routes/app_routes.dart';

class SplashController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    _startApp();
  }

  void _startApp() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offAllNamed(AppRoutes.onboarding1);
  }
}
