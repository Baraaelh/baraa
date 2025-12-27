// choice_controller.dart

import 'package:get/get.dart';
import 'package:project/routes/app_routes.dart';
 
class SelectChoiceController extends GetxController {
  void selectchoice(String role) {
    if (role == "login") {
      Get.toNamed(AppRoutes.login);
    } else {
      Get.toNamed(AppRoutes.register);
    }
  }
}
