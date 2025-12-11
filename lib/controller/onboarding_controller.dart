import 'package:get/get.dart';
import 'package:project/routes/app_routes.dart';

class OnboardingController extends GetxController {
  final RxInt currentIndex = 0.obs;

  void nextPage() {
    if (currentIndex.value < 3) {
      currentIndex.value++;
    }
  }

  void skip() {
    Get.offAllNamed(AppRoutes.login);
  }
}
