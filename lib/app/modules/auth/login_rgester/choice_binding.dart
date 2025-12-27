// lib/app/modules/auth/select_role/choice_binding.dart

import 'package:get/get.dart';
import 'package:project/app/modules/auth/login_rgester/choice_controller.dart';

class SelectchoiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SelectChoiceController());
  }
}
