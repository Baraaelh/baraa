// lib/app/modules/auth/pharmacy_verify/pharmacy_verify_view.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pharmacy_verify_controller.dart';

class PharmacyVerifyView extends GetView<PharmacyVerifyController> {
  const PharmacyVerifyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 🔹 صورة
            Image.asset(
              'assets/images/verify.png', // غيّر الاسم لاحقًا
              height: 150,
            ),

            const SizedBox(height: 24),

            // 🔹 عنوان
            const Text(
              'كود التحقق',
              style: TextStyle(
                  fontSize: 28, fontWeight: FontWeight.bold, color: Colors.green),
            ),

            const SizedBox(height: 12),

            const Text(
              'تم إرسال رمز تحقق مكوّن من 4 أرقام إلى هاتفك',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            // 🔹 خانات OTP (أخضر فاتح)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(4, (index) {
                return SizedBox(
                  width: 60,
                  child: TextField(
                    controller: controller.codeControllers[index],
                    focusNode: controller.focusNodes[index],
                    maxLength: 1,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      counterText: '',
                      filled: true,
                      fillColor: Colors.green[100], // أخضر فاتح
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (value) =>
                        controller.onCodeChanged(value, index),
                  ),
                );
              }),
            ),

            // 🔹 رسالة الخطأ
            Obx(() => controller.errorMessage.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text(
                      controller.errorMessage.value,
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                : const SizedBox()),

            const SizedBox(height: 30),

            // 🔹 زر التأكيد (أخضر غامق)
            Obx(() => controller.isLoading.value
                ? const CircularProgressIndicator()
                : SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[800], // أخضر غامق
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: controller.submitCode,
                      child: const Text(
                        'تأكيد',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )),

            const SizedBox(height: 15),

            // 🔹 إعادة إرسال الرمز
            Obx(() => TextButton(
                  onPressed: controller.resendCooldown.value > 0
                      ? null
                      : controller.resendCode,
                  child: controller.resendCooldown.value > 0
                      ? Text(
                          'إعادة الإرسال (${controller.resendCooldown.value}s)',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      : const Text(
                          'إعادة إرسال الرمز؟',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                )),
          ],
        ),
      ),
    );
  }
}
