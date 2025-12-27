// lib/app/modules/settings/controllers/change_password_controller.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  // مراجع لحقول الإدخال
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // متغيرات للتحكم في رؤية كلمة المرور (إظهار/إخفاء)
  var isOldPasswordVisible = false.obs;
  var isNewPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;

  void toggleOldPasswordVisibility() => isOldPasswordVisible.toggle();
  void toggleNewPasswordVisibility() => isNewPasswordVisible.toggle();
  void toggleConfirmPasswordVisibility() => isConfirmPasswordVisible.toggle();

  void updatePassword() {
    // منطق التحقق (Validation)
    if (newPasswordController.text != confirmPasswordController.text) {
      Get.snackbar("خطأ", "كلمة المرور الجديدة غير متطابقة",
          backgroundColor: Colors.red.withOpacity(0.7), colorText: Colors.white);
      return;
    }

    if (newPasswordController.text.length < 6) {
      Get.snackbar("خطأ", "كلمة المرور يجب أن تكون 6 أحرف على الأقل",
          backgroundColor: Colors.red.withOpacity(0.7), colorText: Colors.white);
      return;
    }

    // هنا يتم استدعاء الـ API لاحقاً
    Get.snackbar("نجاح", "تم تغيير كلمة المرور بنجاح",
        backgroundColor: Colors.green.withOpacity(0.7), colorText: Colors.white);
    
    // العودة لصفحة البروفايل بعد ثانية
    Future.delayed(const Duration(seconds: 1), () => Get.back());
  }

  @override
  void onClose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}