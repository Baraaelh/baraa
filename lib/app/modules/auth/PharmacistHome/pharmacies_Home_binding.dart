// pharmacist_home_binding.dart
import 'package:get/get.dart';
import 'package:project/app/modules/auth/PharmacistHome/Pharmacist_Home_Controller.dart';
import 'package:project/app/modules/auth/pharmacy_register/pharmacy_register_controller.dart';
 
class PharmacistHomeBinding extends Bindings {
  @override
  void dependencies() {
    // استخدم Get.put بدلاً من lazyPut للتأكد من وجوده فوراً
    Get.lazyPut<PharmacistHomeController>(() => PharmacistHomeController());
    Get.lazyPut<PharmacyRegisterController>(() => PharmacyRegisterController());
   }
}