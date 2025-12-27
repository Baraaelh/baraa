// select_role_controller.dart

import 'package:get/get.dart';
import 'package:project/routes/app_routes.dart';
 
class SelectRoleController extends GetxController {
  void selectRole(String role) {
    if (role == "user") {
      Get.toNamed(AppRoutes.register);
    } else {
      Get.toNamed(AppRoutes.register_pharmacy);
    }
  }
}
