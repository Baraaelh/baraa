// lib/app/modules/auth/pharmacy_register/pharmacy_register_binding.dart

import 'package:get/get.dart';
import 'pharmacy_register_controller.dart';

class PharmacyRegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PharmacyRegisterController>(
() => PharmacyRegisterController(),
    );
  }
}
