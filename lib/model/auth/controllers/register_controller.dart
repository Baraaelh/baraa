import 'package:get/get.dart';
import 'package:dio/dio.dart';

class RegisterController extends GetxController {
  final Dio dio = Dio();

  var isLoading = false.obs;

  // حقول الإدخال
  var name = ''.obs;
  var email = ''.obs;
  var password = ''.obs;

  Future<void> register() async {
    if (name.value.isEmpty ||
        email.value.isEmpty ||
        password.value.isEmpty) {
      Get.snackbar("خطأ", "جميع الحقول مطلوبة");
      return;
    }

    try {
      isLoading.value = true;

      final response = await dio.post(
        "https://example.com/api/register",
        data: {
          "name": name.value,
          "email": email.value,
          "password": password.value,
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
