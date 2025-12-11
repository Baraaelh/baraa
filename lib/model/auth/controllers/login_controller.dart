import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import '../../../routes/app_routes.dart';


class LoginController extends GetxController {
  final Dio dio = Dio();

  var isLoading = false.obs;

  // form data
  RxString email = ''.obs;
  RxString password = ''.obs;

  Future<void> login() async {
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("خطأ", "يرجى إدخال البريد وكلمة المرور",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    isLoading.value = true;

    try {
      final response = await dio.post(
        "/auth/login",
        data: {
          "email": email.value,
          "password": password.value,
        },
      );

      if (response.statusCode == 200) {
        // save token لو بدك
        Get.offAllNamed(AppRoutes.home);
      }
    } on DioException catch (e) {
      Get.snackbar("خطأ", e.response?.data["message"] ?? "فشل تسجيل الدخول",
          snackPosition: SnackPosition.BOTTOM, colorText: Colors.white);
    } catch (e) {
      Get.snackbar("خطأ", "حدث خطأ غير متوقع");
    }

    isLoading.value = false;
  }
}
