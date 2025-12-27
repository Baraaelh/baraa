import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';
 import 'package:project/app/modules/auth/PharmacyDetails/Pharmacy_Details_Controller.dart';
 
class PharmacyDetailsBinding extends Bindings {
  @override
  void dependencies() {
   // Get.lazyPut<CartController>(() => CartController());
    Get.lazyPut<PharmacyDetailsController>(() => PharmacyDetailsController(),
    );
  }
}
