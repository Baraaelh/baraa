// lib/app/modules/auth/pharmacy_verify/pharmacy_verify_controller.dart

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PharmacyVerifyController extends GetxController {
  // 🔹 Controllers لكل خانة
  final List<TextEditingController> codeControllers =
      List.generate(4, (_) => TextEditingController());

  // 🔹 FocusNodes للتحكم بالتنقل
  final List<FocusNode> focusNodes =
      List.generate(4, (_) => FocusNode());

  final isLoading = false.obs;
  final errorMessage = ''.obs;
  final resendCooldown = 0.obs;

  Timer? _timer;

  /// تجميع الكود كامل
  String get code =>
      codeControllers.map((c) => c.text).join();

  /// عند الكتابة
  void onCodeChanged(String value, int index) {
    if (value.isNotEmpty && index < 3) {
      focusNodes[index + 1].requestFocus();
    }

    // عند المسح
    if (value.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus();
    }
  }

  /// تأكيد الرمز
  void submitCode() async {
    if (code.length != 4) {
      errorMessage.value = 'الرجاء إدخال رمز مكوّن من 4 أرقام';
      return;
    }

    try {
      isLoading.value = true;
      errorMessage.value = '';

      // 🔜 لاحقًا: API
      await Future.delayed(const Duration(seconds: 2));

      Get.offAllNamed('/profile-image');
    } catch (e) {
      errorMessage.value = 'رمز غير صحيح';
    } finally {
      isLoading.value = false;
    }
  }

  /// إعادة الإرسال
  void resendCode() {
    startResendTimer();
    Get.snackbar('تم', 'تم إرسال الرمز مجددًا');
  }

  void startResendTimer() {
    resendCooldown.value = 30;
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (resendCooldown.value > 0) {
        resendCooldown.value--;
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void onClose() {
    for (final c in codeControllers) {
      c.dispose();
    }
    for (final f in focusNodes) {
      f.dispose();
    }
    _timer?.cancel();
    super.onClose();
  }
}
