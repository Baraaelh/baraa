

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio_instance;
import '../../../../api_service/api_service.dart';
import '../../../../routes/app_routes.dart';
import '../../../services/auth_service.dart';
import '../pharmacy_register/PharmacyRegisterModel.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ApiService apiService = ApiService();

  Future<void> login() async {
    String emailText = emailController.text.trim();
    String passwordText = passwordController.text.trim();

    if (emailText.isEmpty || passwordText.isEmpty) {
      Get.snackbar("تنبيه", "يرجى تعبئة الحقول");
      return;
    }

    isLoading.value = true;

    // 1. الفحص في البيانات الوهمية (Mock Check)
    // هذا يشمل "صيدلية الشفاء" وأي صيدلية سجلتها بيدك في الريجستر
    final mockUser = Get.find<AuthService>().findMockUser(emailText, passwordText);

    if (mockUser != null) {
      await Future.delayed(const Duration(milliseconds: 800)); // محاكاة
      
      // حفظ المستخدم في الجلسة
      Get.find<AuthService>().setUser(mockUser);
      
      isLoading.value = false;
      Get.snackbar("وضع التجربة", "تم الدخول بنجاح: ${mockUser.namePharmacy}");
      Get.offAllNamed(AppRoutes.PHARMACY_Home);
      return; // خروج لعدم الحاجة للسيرفر
    }

    // 2. الفحص في السيرفر الحقيقي (Backend Check)
    try {
      final response = await apiService.dio.post(
        "/auth/login",
        data: {"email": emailText, "password": passwordText},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final realUser = PharmacyRegisterModel.fromJson(response.data['user']);
        
        Get.find<AuthService>().setUser(realUser);
        
        Get.snackbar("نجاح", "أهلاً بك ${realUser.namePharmacy}");
        Get.offAllNamed(AppRoutes.home);
      }
    } on dio_instance.DioException catch (e) {
      Get.snackbar("فشل الدخول", e.response?.data["message"] ?? "تأكد من البيانات والاتصال");
    } catch (e) {
      Get.snackbar("خطأ", "حدث خطأ ما");
    } finally {
      isLoading.value = false;
    }
  }
}