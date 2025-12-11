import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(height: 40),

                  const Text(
                    "إنشاء حساب",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "سجّل حساب جديد للمتابعة",
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),

                  const SizedBox(height: 40),

                  // الاسم
                  TextField(
                    onChanged: (value) => controller.name.value = value,
                    decoration: const InputDecoration(
                      labelText: "الاسم الكامل",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // الإيميل
                  TextField(
                    onChanged: (value) => controller.email.value = value,
                    decoration: const InputDecoration(
                      labelText: "البريد الإلكتروني",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // الباسورد
                  TextField(
                    obscureText: true,
                    onChanged: (value) => controller.password.value = value,
                    decoration: const InputDecoration(
                      labelText: "كلمة المرور",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // زر التسجيل
                  Obx(() {
                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed:
                            controller.isLoading.value ? null : controller.register,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        child: controller.isLoading.value
                            ? const CircularProgressIndicator(color: Colors.white)
                            : const Text(
                                "إنشاء حساب",
                                style: TextStyle(fontSize: 18),
                              ),
                      ),
                    );
                  }),

                  const SizedBox(height: 20),

                  // الانتقال للّوجن
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("لديك حساب بالفعل؟"),
                      TextButton(
                        onPressed: () => Get.back(),
                        child: const Text("تسجيل الدخول"),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
