// lib/app/modules/Cart/Cart_binding.dart

import 'package:get/get.dart';
import 'package:project/app/modules/auth/Cart/Cart_Controller.dart';
//import 'package:project/app/modules/auth/PharmacyDetails/Pharmacy_Details_Controller.dart';
import 'package:project/app/modules/auth/pharmacy_register/pharmacy_register_controller.dart';
 
class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartController>(() => CartController());
    Get.lazyPut<PharmacyRegisterController>(() => PharmacyRegisterController());

  }
}
