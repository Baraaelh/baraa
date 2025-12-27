import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:project/app/modules/auth/Widget/main_layout_controller.dart';

class MainLayoutBinding extends Bindings {
  @override
  void dependencies() {
    // استخدم fenix: true ليبقى الكنترولر حياً عند التنقل بين هذه الصفحات
    Get.lazyPut(() => MainLayoutController(), fenix: true);
  }
}