import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';
import '../../../routes/app_routes.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // صورة التطبيق
                Image.asset(
                  "assets/images/logo.png", // حط مسار الصورة عندك
                  width: 120,
                  height: 120,
                ),

                const SizedBox(height: 16),

                // اسم التطبيق (تقدر تغيّره)
                const Text(
                  "اسم التطبيق",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 30),

                const Text(
                  "تسجيل الدخول",
                  style: TextStyle(
                      fontSize: 28, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 30),

                // Email
                TextField(
                  decoration: const InputDecoration(
                      labelText: "البريد الإلكتروني"),
                  onChanged: (v) => controller.email.value = v,
                ),

                const SizedBox(height: 20),

                // Password
                TextField(
                  decoration: const InputDecoration(
                      labelText: "كلمة المرور"),
                  obscureText: true,
                  onChanged: (v) => controller.password.value = v,
                ),

                const SizedBox(height: 30),

                Obx(() {
                  return controller.isLoading.value
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 48),
                          ),
                          onPressed: controller.login,
                          child: const Text("تسجيل الدخول"),
                        );
                }),

                const SizedBox(height: 20),

                TextButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.register);
                  },
                  child: const Text("إنشاء حساب جديد"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
