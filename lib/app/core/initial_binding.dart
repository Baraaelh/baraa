import 'package:get/get.dart';
import 'package:project/app/services/auth_service.dart';
 import '../../../../api_service/api_service.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    // fenix: true تجعل الخدمة تعيد بناء نفسها إذا حُذفت من الذاكرة
    Get.lazyPut(() => AuthService(), fenix: true);
    Get.lazyPut(() => ApiService(), fenix: true);
  }
}