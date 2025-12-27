import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/api_service/api_service.dart';
import 'package:project/app/modules/auth/AddMedicine/Medicine_Model.dart';
 import 'package:project/app/services/auth_service.dart';
 
class InventoryController extends GetxController {
  final ApiService apiService = ApiService();
  final authService = Get.find<AuthService>();

  var myInventory = <MedicineModel>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    // بدلاً من الاستدعاء المباشر الذي قد يسبب الخطأ أثناء الـ build
    // ننتظر انتهاء أول Frame للرسم
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadAllInventory();
      
    });
  }

  // دالة جلب ودمج البيانات
  void loadAllInventory() async {
    isLoading.value = true;
    
    // 1. جلب بيانات صيدلية الشفاء (الموك)
    List<MedicineModel> mocks = authService.mockDatabase
        .firstWhere((p) => p.namePharmacy.contains("الشفاء"))
        .medicines;

    // 2. محاولة جلب الأدوية المضافة حديثاً من الباك اند
    try {
      final response = await apiService.dio.get("/pharmacy/my-medicines");
      if (response.statusCode == 200) {
        List data = response.data;
        var serverMeds = data.map((e) => MedicineModel.fromJson(e)).toList();
        myInventory.assignAll([...mocks, ...serverMeds]);
      }
    } catch (e) {
      myInventory.assignAll(mocks); // في حال فشل السيرفر نعرض الموك
    } finally {
      isLoading.value = false;
    }
  }

  // دالة تحديث السعر فقط للباك اند
  Future<void> updateMedicinePrice(String medId, double newPrice) async {
    try {
      final response = await apiService.dio.patch(
        "/pharmacy/update-price/$medId",
        data: {"price": newPrice},
      );

      if (response.statusCode == 200) {
        // تحديث القائمة محلياً فوراً
        int index = myInventory.indexWhere((m) => m.id == medId);
        if (index != -1) {
          myInventory[index].price = newPrice;
          myInventory.refresh();
        }
        Get.snackbar("نجاح", "تم تحديث السعر بنجاح", backgroundColor: Colors.green, colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar("خطأ", "فشل تحديث السعر في السيرفر");
    }
  }
}