// lib/app/modules/pharmacy/bindings/pharmacy_binding.dart

import 'package:get/get.dart';
 import 'package:project/app/modules/auth/pharmacies_choice/pharmacies_controller.dart';

class PharmacyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PharmacyListController>(() => PharmacyListController());
   }
}