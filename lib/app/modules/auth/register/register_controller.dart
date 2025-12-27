import 'package:get/get.dart';
import 'package:dio/dio.dart';

class RegisterController extends GetxController {
  final Dio dio = Dio();

  var isLoading = false.obs;

  // حقول الإدخال
  var username = ''.obs;
  var email = ''.obs;
  var password = ''.obs;
  var confirmPassword = ''.obs;

  Future<void> register() async {
    if (username.value.isEmpty || email.value.isEmpty || password.value.isEmpty || confirmPassword.value.isEmpty) {
      Get.snackbar("خطأ", "جميع الحقول مطلوبة");
      return;
    }

    try {
      isLoading.value = true;

      final response = await dio.post(
        "https://example.com/api/register",
        data: {
          "username": username.value,
          "email": email.value,
          "password": password.value,
          "confirmPassword": confirmPassword.value,
        },
      );

      if (response.statusCode == 200) {
        Get.snackbar("نجاح", "تم انشاء الحساب بنجاح");
        Get.back(); // رجوع للّوجن
      }
    } catch (e) {
      Get.snackbar("خطأ", "حدث خطأ أثناء التسجيل");
    } finally {
      isLoading.value = false;
    }
  }
}
