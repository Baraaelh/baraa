// lib/app/modules/auth/select_role/select_role_binding.dart

import 'package:get/get.dart';
import 'select_role_controller.dart';

class SelectRoleBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SelectRoleController());
  }
}
