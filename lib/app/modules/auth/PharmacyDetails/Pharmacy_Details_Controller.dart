// PharmacyDetailsController.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/modules/auth/AddMedicine/Medicine_Model.dart';
 import 'package:project/app/modules/auth/Cart/Cart_Controller.dart';
import 'package:project/app/modules/auth/pharmacy_register/PharmacyRegisterModel.dart';

class PharmacyDetailsController extends GetxController {
  late PharmacyRegisterModel pharmacy;
  var medicinesList = <MedicineModel>[].obs;
  var isLoading = false.obs; 

  // ربط كنترولر السلة للتمكن من إضافة الأدوية إليه
   // final CartController cartController = Get.find<CartController>();

  @override
  void onInit() {
    super.onInit();
 
    if (Get.arguments != null && Get.arguments is PharmacyRegisterModel) {
      pharmacy = Get.arguments as PharmacyRegisterModel;
      loadPharmacyData();
    }
  }

  void loadPharmacyData() async {
    isLoading.value = true;
    await Future.delayed(const Duration(milliseconds: 400)); 
    medicinesList.assignAll(pharmacy.medicines);
    isLoading.value = false;
  }
  void _initializeData() {
    if (Get.arguments != null && Get.arguments is PharmacyRegisterModel) {
      pharmacy = Get.arguments as PharmacyRegisterModel;
      // التأكد من تحميل الأدوية فوراً
      medicinesList.assignAll(pharmacy!.medicines);
    } else {
      debugPrint("تحذير: لم يتم تمرير بيانات الصيدلية عبر arguments");
    }
  }

  // دالة الإضافة للسلة وخصم الكمية
  void addToCart(MedicineModel medicine) {
    if (medicine.quantity > 0) {
      medicine.quantity--; // تنقيص الكمية في صفحة التفاصيل
      medicinesList.refresh(); // تحديث الواجهة

     // Get.find<CartController>().addProduct(medicine);
      
      // إضافة الدواء للسلة (نمرر كائن الدواء نفسه)
    // cartController.addProduct(medicine);
      
      Get.snackbar(
        "تمت الإضافة", 
        "تم إضافة ${medicine.name} للسلة",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 1),
      );
    } else {
      Get.snackbar("عذراً", "هذا الدواء نفد من المخزون", backgroundColor: Colors.red.withOpacity(0.5));
    }
  }
}