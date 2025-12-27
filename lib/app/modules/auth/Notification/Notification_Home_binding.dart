import 'package:get/get.dart';
import 'package:project/app/modules/auth/Notification/Notification_Controller.dart';
 
class NotificationHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationController>(() => NotificationController());
  }
}
