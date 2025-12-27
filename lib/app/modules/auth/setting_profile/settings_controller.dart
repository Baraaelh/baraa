import 'package:get/get.dart';

class SettingsController extends GetxController {
  void logout() {
    // TODO: API logout
    Get.offAllNamed('/login_view');
  }
}
