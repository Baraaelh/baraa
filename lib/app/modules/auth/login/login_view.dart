// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controllers/login_controller.dart';
// import '../../../routes/app_routes.dart';

// class LoginView extends StatelessWidget {
//   const LoginView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<LoginController>();

//     return Scaffold(
//       backgroundColor: Colors.white, // خلفية بيضاء
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 24),
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center, // محتوى في المنتصف عمودياً
//               crossAxisAlignment: CrossAxisAlignment.center, // محتوى في المنتصف أفقياً
//               children: [
//                 // صورة التطبيق
//                 Image.asset(
//                   "assets/images/logo.png",
//                   width: 120,
//                   height: 120,
//                 ),

//                 const SizedBox(height: 16),

//                 // اسم التطبيق
//                 const Text(
//                   "اسم التطبيق",
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),

//                 const SizedBox(height: 30),

//                 const Text(
//                   "تسجيل الدخول",
//                   style: TextStyle(
//                       fontSize: 28,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black),
//                   textAlign: TextAlign.center,
//                 ),

//                 const SizedBox(height: 30),

//                 // Email
//                 TextField(
//                   decoration: const InputDecoration(
//                       labelText: "البريد الإلكتروني",
//                       border: OutlineInputBorder()),
//                   onChanged: (v) => controller.email.value = v,
//                   textAlign: TextAlign.center, // النص داخل الخانة في الوسط
//                 ),

//                 const SizedBox(height: 20),

//                 // Password
//                 TextField(
//                   decoration: const InputDecoration(
//                       labelText: "كلمة المرور",
//                       border: OutlineInputBorder()),
//                   obscureText: true,
//                   onChanged: (v) => controller.password.value = v,
//                   textAlign: TextAlign.center, // النص داخل الخانة في الوسط
//                 ),

//                 const SizedBox(height: 30),

//                 Obx(() {
//                   return controller.isLoading.value
//                       ? const CircularProgressIndicator()
//                       : ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             minimumSize: const Size(double.infinity, 48),
//                           ),
//                           onPressed: controller.login,
//                           child: const Text("تسجيل الدخول"),
//                         );
//                 }),

//                 const SizedBox(height: 20),

//                 TextButton(
//                   onPressed: () {
//                     Get.toNamed(AppRoutes.register);
//                   },
//                   child: const Text("إنشاء حساب جديد"),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_controller.dart';
import '../../../../routes/app_routes.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();

    return Scaffold(
      backgroundColor: Colors.white, 
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                // الصورة
                Image.asset(
                  "assets/images/logo.png",
                  width: 120,
                  height: 120,
                ),

                const SizedBox(height: 40), // مسافة إضافية بين الصورة والفورم

                const Text(
                  "تسجيل الدخول",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 30),

                // Email / Phone
                TextField(
                  textDirection: TextDirection.rtl,  // النص من اليمين
                  decoration: InputDecoration(
                    labelText: "البريد الإلكتروني / رقم الهاتف",
                    filled: true,
                    fillColor: Colors.grey.shade200, // خلفية رمادي فاتح
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 18,
                      horizontal: 16,
                    ),
                  ),
                  onChanged: (v) => controller.emailController.text = v,
                ),

                const SizedBox(height: 20), // مسافة بين الحقلين

                // Password
                TextField(
                  textDirection: TextDirection.rtl,  // النص من اليمين
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "كلمة المرور",
                    filled: true,
                    fillColor: Colors.grey.shade200, 
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 18,
                      horizontal: 16,
                    ),
                  ),
                  onChanged: (v) => controller.passwordController.text = v,
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
                          // onPressed:(){
                          //   context.read<LoginController>().login();
                          // }
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
