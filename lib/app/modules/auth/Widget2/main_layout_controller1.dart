import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class MainLayoutController1 extends GetxController {
  var currentIndex = 0.obs;

  void changePage(int index) {
    if (currentIndex.value == index) return; // منع إعادة تحميل نفس الصفحة

    currentIndex.value = index;

    switch (index) {
      case 0:
        Get.offNamed('/Pharmacist_Home_Views');
        break; // صفحة الهوم 55
      case 1:
        Get.offNamed('/Inventory_View');
        break;
      case 2:
        Get.offNamed('/stock');
        break;
    }

   
  }
}
