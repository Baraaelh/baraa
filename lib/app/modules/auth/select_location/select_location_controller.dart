import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  final areaController = TextEditingController();
  final streetController = TextEditingController();
  final houseNumController = TextEditingController();
  final floorController = TextEditingController();
  final apartmentController = TextEditingController();

  // متغير لتخزين الإحداثيات لو تم اختيارها من الخريطة لاحقاً
  var selectedLocation = "".obs; 

  void openGoogleMaps() {
    // هنا ننتقل لصفحة الخريطة التفاعلية
    // Get.toNamed('/google-maps-picker');
    print("فتح خريطة جوجل...");
  }

  void saveAddress() {
    // منطق حفظ العنوان والعودة للهوم
    Get.back();
    Get.snackbar("تم الحفظ", "تم تحديث موقعك الحالي بنجاح", 
      snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green, colorText: Colors.white);
  }
}