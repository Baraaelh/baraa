// lib/app/modules/settings/bindings/change_password_binding.dart

import 'package:get/get.dart';
import 'package:project/app/modules/auth/ChangePassword/change_password_controller.dart';

class ChangePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChangePasswordController>(
      () => ChangePasswordController(),
    );
  }
}