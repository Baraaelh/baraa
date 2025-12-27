import 'package:get/get.dart';
import 'package:project/app/modules/auth/select_location/select_location_controller.dart';

class SelectLocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddressController>(() => AddressController());
  }
}
// class SelectLocationBinding extends Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut<SelectLocationController>(() => SelectLocationController());
//   }
// }

