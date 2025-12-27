import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class MainLayoutController extends GetxController {
  var currentIndex = 0.obs;

  void changePage(int index) {
    if (currentIndex.value == index) return; // منع إعادة تحميل نفس الصفحة
    
    currentIndex.value = index;
    
    switch (index) {
      case 0: Get.offNamed('/home_view'); break;
      case 1: Get.offNamed('/pharmacies'); break; // تأكد أن الاسم يطابق Routes
      case 2: Get.offNamed('/chat'); break;
      case 3: Get.offNamed('/profile'); break;
    }
  }
}