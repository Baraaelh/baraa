// lib/app/modules/auth/pharmacy_register/pharmacy_register_view.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pharmacy_register_controller.dart';

class PharmacyRegisterView extends GetView<PharmacyRegisterController> {
  const PharmacyRegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                const Icon(Icons.local_pharmacy, size: 60, color: Colors.green),
                const SizedBox(height: 20),
                const Text(
                  'إنشاء حساب صيدلية',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),

                _input(
                  controller: controller.nameController,
                  hint: 'الاسم الكامل',
                  icon: Icons.store,
                ),

                _input(
                  controller: controller.namePharmacyController,
                  hint: 'اسم الصيدلية',
                  icon: Icons.description,
                ),

                _input(
                  controller: controller.phoneController,
                  hint: 'رقم الجوال',
                  icon: Icons.phone,
                  type: TextInputType.phone,
                ),

                _input(
                  controller: controller.emailController,
                  hint: 'البريد الإلكتروني',
                  icon: Icons.email,
                  type: TextInputType.emailAddress,
                ),

                Obx(() => _passwordInput(
                  controller: controller.passwordController,
                  hint: 'كلمة المرور',
                  visible: controller.passwordVisible.value,
                  toggle: () => controller.passwordVisible.toggle(),
                )),

                Obx(() => _passwordInput(
                  controller: controller.confirmPasswordController,
                  hint: 'تأكيد كلمة المرور',
                  visible: controller.confirmPasswordVisible.value,
                  toggle: () => controller.confirmPasswordVisible.toggle(),
                  confirm: true,
                )),

                Obx(() => controller.errorMessage.isNotEmpty
                    ? Text(controller.errorMessage.value,
                        style: const TextStyle(color: Colors.red))
                    : const SizedBox()),

                const SizedBox(height: 30),

                Obx(() => controller.isLoading.value
                    ? const CircularProgressIndicator()
                    : SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: controller.submitRegister,
                          child: const Text('إنشاء الحساب'),
                        ),
                      )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ---------- Widgets ----------
  Widget _input({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    TextInputType type = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        validator: (v) => v!.isEmpty ? 'مطلوب' : null,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }

  Widget _passwordInput({
    required TextEditingController controller,
    required String hint,
    required bool visible,
    required VoidCallback toggle,
    bool confirm = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        obscureText: !visible,
        validator: (v) {
          if (v == null || v.length < 6) return '6 أحرف على الأقل';
          if (confirm &&
              v != Get.find<PharmacyRegisterController>()
                  .passwordController
                  .text) {
            return 'غير متطابق';
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: const Icon(Icons.lock),
          suffixIcon: IconButton(
            icon: Icon(visible ? Icons.visibility : Icons.visibility_off),
            onPressed: toggle,
          ),
        ),
      ),
    );
  }
}
