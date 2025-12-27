// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controllers/register_controller.dart';

// class RegisterView extends GetView<RegisterController> {
//   const RegisterView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//         body: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.all(24.0),
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   const SizedBox(height: 40),

//                   const Text(
//                     "إنشاء حساب",
//                     style: TextStyle(
//                       fontSize: 28,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 5),
//                   const Text(
//                     "سجّل حساب جديد للمتابعة",
//                     style: TextStyle(fontSize: 15, color: Colors.grey),
//                   ),

//                   const SizedBox(height: 40),

//                   // الاسم
//                   TextField(
//                     onChanged: (value) => controller.name.value = value,
//                     decoration: const InputDecoration(
//                       labelText: "الاسم الكامل",
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                   const SizedBox(height: 20),

//                   // الإيميل
//                   TextField(
//                     onChanged: (value) => controller.email.value = value,
//                     decoration: const InputDecoration(
//                       labelText: "البريد الإلكتروني",
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                   const SizedBox(height: 20),

//                   // الباسورد
//                   TextField(
//                     obscureText: true,
//                     onChanged: (value) => controller.password.value = value,
//                     decoration: const InputDecoration(
//                       labelText: "كلمة المرور",
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                   const SizedBox(height: 30),

//                   // زر التسجيل
//                   Obx(() {
//                     return SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         onPressed:
//                             controller.isLoading.value ? null : controller.register,
//                         style: ElevatedButton.styleFrom(
//                           padding: const EdgeInsets.symmetric(vertical: 14),
//                         ),
//                         child: controller.isLoading.value
//                             ? const CircularProgressIndicator(color: Colors.white)
//                             : const Text(
//                                 "إنشاء حساب",
//                                 style: TextStyle(fontSize: 18),
//                               ),
//                       ),
//                     );
//                   }),

//                   const SizedBox(height: 20),

//                   // الانتقال للّوجن
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Text("لديك حساب بالفعل؟"),
//                       TextButton(
//                         onPressed: () => Get.back(),
//                         child: const Text("تسجيل الدخول"),
//                       )
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'register_controller.dart';
import '../../../../routes/app_routes.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RegisterController>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                // اللوجو
                Image.asset(
                  "assets/images/regiter.png",
                  width: 120,
                  height: 120,
                ),

                const SizedBox(height: 30),

                const Text(
                  "إنشاء حساب",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 35),

                _input("اسم المستخدم", (v) => controller.username.value = v),
                const SizedBox(height: 20),

                _input("البريد الإلكتروني", (v) => controller.email.value = v),
                const SizedBox(height: 20),

                _input("كلمة المرور", (v) => controller.password.value = v, isPassword: true),
                const SizedBox(height: 20),

                _input("تأكيد كلمة المرور", (v) => controller.confirmPassword.value = v, isPassword: true),

                const SizedBox(height: 30),

                // زر تسجيل
                Obx(() {
                  return controller.isLoading.value
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 48),
                          ),
                          onPressed: controller.register,
                          child: const Text("تسجيل"),
                        );
                }),

                const SizedBox(height: 20),

                // تمتلك حساب؟ تسجيل الدخول
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("تمتلك حساب؟"),
                    TextButton(
                      onPressed: () => Get.toNamed(AppRoutes.login),
                      child: const Text("تسجيل دخول"),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // أيقونات السوشيال
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _socialIcon(Icons.facebook, Colors.blue),
                    const SizedBox(width: 25),
                    _socialIcon(Icons.g_mobiledata, Colors.red),
                    const SizedBox(width: 25),
                    _socialIcon(Icons.alternate_email, Colors.lightBlue),
                  ],
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _input(String label, Function(String) onChanged, {bool isPassword = false}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Directionality(
        textDirection: TextDirection.rtl, // عكس اتجاه الكتابة
        child: TextField(
          obscureText: isPassword,
          style: const TextStyle(fontWeight: FontWeight.bold), // الخط بولد
          decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget _socialIcon(IconData icon, Color color) {
    return CircleAvatar(
      radius: 22,
      backgroundColor: Colors.grey[200],
      child: Icon(icon, color: color, size: 28),
    );
  }
}
