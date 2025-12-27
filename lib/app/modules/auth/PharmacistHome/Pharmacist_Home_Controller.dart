import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../services/auth_service.dart';
import '../pharmacy_register/PharmacyRegisterModel.dart';

class PharmacistHomeController extends GetxController {
  
  // نستخدم Rxn ليكون متوافقاً مع حالة أن البيانات قد تتأخر أو تكون null
  final Rxn<PharmacyRegisterModel> currentPharmacy = Rxn<PharmacyRegisterModel>();

  @override
  void onInit() {
    super.onInit();
    _loadPharmacyData();
  }

  // دالة جلب بيانات الصيدلية من الخدمة المركزية
  void _loadPharmacyData() {
    // نجلب البيانات من AuthService الذي ملأناه في الـ Login أو الـ Register
    var authService = Get.find<AuthService>();
    
    if (authService.currentPharmacy.value != null) {
      currentPharmacy.value = authService.currentPharmacy.value;
    } else {
      // إذا لم يجد بيانات (حالة نادرة)، نرجعه للوجين
      print("Error: No pharmacy data found in AuthService");
    }
  }

  // دالة تسجيل الخروج باستخدام الخدمة
  void showLogoutDialog() {
  Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // ليأخذ حجم المحتوى فقط
          children: [
            // أيقونة فخمة في الأعلى
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.logout_rounded, color: Colors.redAccent, size: 40),
            ),
            const SizedBox(height: 20),
            const Text(
              "تسجيل الخروج",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "هل أنت متأكد أنك تريد مغادرة التطبيق؟",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 30),
            
            // زر التأكيد (في الأعلى)
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Get.find<AuthService>().logout();
                  Get.offAllNamed('/login_view');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF59A985),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 0,
                ),
                child: const Text(
                  "تأكيد الخروج",
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 12),
            
            // زر الإلغاء (في الأسفل)
            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton(
                onPressed: () => Get.back(),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.grey),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text(
                  "إلغاء",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

  void goToNotifications() {
    Get.toNamed('/Notifications_View');
  }

  void navigateToAddMedication() {
    // نمرر الـ UID لصفحة الإضافة إذا لزم الأمر، رغم أنه موجود في الـ AuthService
    Get.toNamed('/AddMedicine_View'); 
  }
}