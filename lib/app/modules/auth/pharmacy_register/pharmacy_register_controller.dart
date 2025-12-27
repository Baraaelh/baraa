import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio_instance;
import '../../../../api_service/api_service.dart';
import '../../../../routes/app_routes.dart';
import '../../../services/auth_service.dart';
import 'PharmacyRegisterModel.dart';

class PharmacyRegisterController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final ApiService apiService = ApiService();

  // الكنترولرات النصية للحقول
  final nameController = TextEditingController();
  final namePharmacyController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // حالات الواجهة (States)
  var isLoading = false.obs;
  var passwordVisible = false.obs;
  var confirmPasswordVisible = false.obs;
  var errorMessage = ''.obs;

  // تبديل رؤية كلمة المرور
  void togglePasswordVisibility() => passwordVisible.toggle();
  void toggleConfirmPasswordVisibility() => confirmPasswordVisible.toggle();

  @override
  void onInit() {
    super.onInit();
  }

  // دالة التسجيل الأساسية
  Future<void> submitRegister() async {
    // 1. التحقق من صحة المدخلات (Validation)
    if (!formKey.currentState!.validate()) return;

    try {
      isLoading.value = true;
      errorMessage.value = '';

      // 2. تجهيز بيانات الصيدلية من الكنترولرات
      final newPharmacyRequest = PharmacyRegisterModel(
        uid: null, // سيتم تعيينه من السيرفر أو وهمياً
        name: nameController.text.trim(),
        namePharmacy: namePharmacyController.text.trim(),
        address: addressController.text.trim(),
        phone: phoneController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text,
        passwordConfirmation: confirmPasswordController.text,
        medicines: [], // تبدأ القائمة فارغة عند التسجيل
      );

      // 3. الربط الحقيقي مع الباك إند عبر Dio
      // ملاحظة: قمت بوضعها داخل try-catch فرعي لضمان استمرار عمل التطبيق بالبيانات الوهمية إذا فشل السيرفر
      try {
        final response = await apiService.dio.post(
          '/register', 
          data: newPharmacyRequest.toJson(),
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          // إذا نجح السيرفر، نأخذ البيانات الحقيقية (التي تحتوي على الـ UID الحقيقي)
          final registeredUser = PharmacyRegisterModel.fromJson(response.data['user']);
          
          // حفظ في الخدمة (Session)
          Get.find<AuthService>().setUser(registeredUser);
          
          // إضافة للقاعدة الوهمية لضمان عمل Login لاحقاً بنفس الجلسة
          Get.find<AuthService>().addMockUser(registeredUser);

          Get.snackbar("نجاح", "تم تسجيل صيدلية ${registeredUser.namePharmacy} بنجاح");
          Get.offAllNamed(AppRoutes.home);
          return; // إنهاء الدالة هنا
        }
      } on dio_instance.DioException catch (e) {
        print("Backend Error: ${e.response?.data}");
        // إذا أردت إظهار خطأ السيرفر للمستخدم:
        // errorMessage.value = e.response?.data['message'] ?? "خطأ في السيرفر";
      }

      // 4. مسار البيانات الوهمية (في حال فشل السيرفر أو أردت التجربة فقط)
      // نقوم بإنشاء UID وهمي مؤقت للتجربة
      final mockRegisteredUser = PharmacyRegisterModel(
        uid: "PH-${DateTime.now().millisecondsSinceEpoch}", 
        name: nameController.text.trim(),
        namePharmacy: namePharmacyController.text.trim(),
        address: addressController.text.trim(),
        phone: phoneController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text,
        passwordConfirmation: confirmPasswordController.text,
        medicines: [],
      );

      // إضافة الحساب للقائمة الوهمية في AuthService عشان تقدر تعمل لوجين فيه
      Get.find<AuthService>().addMockUser(mockRegisteredUser);

      // توجيه المستخدم لصفحة تسجيل الدخول ليفحص بياناته الجديدة
      Get.snackbar("وضع التجربة", "تم الحفظ محلياً، يمكنك الآن تسجيل الدخول");
      Get.offAllNamed(AppRoutes.login);

    } catch (e) {
      Get.snackbar("خطأ", "حدث خطأ غير متوقع: $e");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    // تنظيف الكنترولرات عند حذف الكنترولر من الذاكرة
    nameController.dispose();
    namePharmacyController.dispose();
    addressController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}