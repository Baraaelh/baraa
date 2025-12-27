// lib/app/modules/settings/views/change_password_view.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/modules/auth/ChangePassword/change_password_controller.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          "تغيير كلمة المرور",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              // الصورة في الأعلى
              Center(
                child: Image.asset(
                  'assets/images/reset_password.png', // تأكد من وجود الصورة بهذا المسار
                  height: 180,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 40),

              // الحقول الثلاثة
              Obx(() => _buildPasswordField(
                    controller: controller.currentPasswordController,
                    label: "كلمة المرور الحالية",
                    isVisible: controller.isOldPasswordVisible.value,
                    onToggle: controller.toggleOldPasswordVisibility,
                  )),
              const SizedBox(height: 20),
              Obx(() => _buildPasswordField(
                    controller: controller.newPasswordController,
                    label: "كلمة المرور الجديدة",
                    isVisible: controller.isNewPasswordVisible.value,
                    onToggle: controller.toggleNewPasswordVisibility,
                  )),
              const SizedBox(height: 20),
              Obx(() => _buildPasswordField(
                    controller: controller.confirmPasswordController,
                    label: "تأكيد كلمة المرور الجديدة",
                    isVisible: controller.isConfirmPasswordVisible.value,
                    onToggle: controller.toggleConfirmPasswordVisibility,
                  )),

              const SizedBox(height: 50),

              // زر التأكيد
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2D6A4F), // لونك الأخضر
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 2,
                  ),
                  onPressed: () => controller.updatePassword(),
                  child: const Text(
                    "تأكيد التغيير",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String label,
    required bool isVisible,
    required VoidCallback onToggle,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: !isVisible,
          decoration: InputDecoration(
            hintText: "********",
            filled: true,
            fillColor: Colors.grey.shade50,
            prefixIcon: const Icon(Icons.lock_outline, color: Color(0xFF2D6A4F)),
            suffixIcon: IconButton(
              icon: Icon(
                isVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
              ),
              onPressed: onToggle,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.grey.shade200),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.grey.shade200),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Color(0xFF2D6A4F)),
            ),
          ),
        ),
      ],
    );
  }
}