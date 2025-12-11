// import 'package:get/get.dart';
// import 'package:project/model/auth/views/login_view.dart';
// import 'package:project/model/auth/views/register_view.dart';
// import 'package:project/routes/app_routes.dart';
// import '../view/screen/splash/splash_view.dart';
// import '../view/screen/onboarding/onboarding1.dart';
// import '../view/screen/onboarding/onboarding2.dart';
// import '../view/screen/onboarding/onboarding3.dart';
// import '../view/screen/onboarding/onboarding4.dart';
// import '../view/screen/auth/otp_view.dart';
// import '../view/screen/main/home_view.dart';
// import '../binding/app_binding.dart';

// class AppPages {
//   static final pages = [
//    // GetPage(name: Routes.splash, page: () => SplashView(), binding: AppBinding()),
//     GetPage(name: Routes.onboarding1, page: () => Onboarding1()),
//     GetPage(name: Routes.onboarding2, page: () => Onboarding2()),
//     GetPage(name: Routes.onboarding3, page: () => Onboarding3()),
//     GetPage(name: Routes.onboarding4, page: () => Onboarding4()),
//     GetPage(name: Routes.login, page: () => LoginView()),
//     GetPage(name: Routes.register, page: () => RegisterView()),
//     // GetPage(name: Routes.otp, page: () => OtpView()),
//     // GetPage(name: Routes.home, page: () => HomeView()),
//   ];
// }


// lib/routes/app_pages.dart

import 'package:get/get.dart';
import 'package:project/model/auth/bindings/login_binding.dart';
import 'package:project/model/auth/bindings/register_binding.dart';
import 'package:project/model/auth/views/login_view.dart';
import 'package:project/model/auth/views/register_view.dart';
import 'package:project/view/screen/splash/splash_view.dart';


import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashView(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
  //   GetPage(
  //     name: AppRoutes.home,
  //     page: () => const HomeView(),
  //     binding: HomeBinding(),
  //   ),
   ];
}



// import 'package:get/get.dart';

// // Auth
// import '../modules/auth/views/login_view.dart';
// import '../modules/auth/views/register_view.dart';
// import '../modules/auth/bindings/login_binding.dart';
// import '../modules/auth/bindings/register_binding.dart';

// // Home
// import '../modules/home/views/home_view.dart';
// import '../modules/home/bindings/home_binding.dart';

// import 'app_routes.dart';

// class AppPages {
//   static final pages = [
//     // ---------------- AUTH ----------------
//     GetPage(
//       name: AppRoutes.login,
//       page: () => const LoginView(),
//       binding: LoginBinding(),
//     ),

//     GetPage(
//       name: AppRoutes.register,
//       page: () => const RegisterView(),
//       binding: RegisterBinding(),
//     ),

//     // ---------------- HOME ----------------
//     GetPage(
//       name: AppRoutes.home,
//       page: () => const HomeView(),
//       binding: HomeBinding(),
//     ),
//   ];
// }

