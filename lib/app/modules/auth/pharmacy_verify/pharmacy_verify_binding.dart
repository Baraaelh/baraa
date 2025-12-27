// lib/app/modules/auth/pharmacy_verify/pharmacy_verify_binding.dart

import 'package:get/get.dart';
import 'pharmacy_verify_controller.dart';

class PharmacyVerifyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PharmacyVerifyController>(
      () => PharmacyVerifyController(),
    );
  }
}
