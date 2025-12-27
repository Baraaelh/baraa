import 'package:get/get.dart';
import 'package:project/app/modules/auth/Notification/Notification_Model.dart';

class NotificationController extends GetxController {
  // قائمة الإشعارات (تستخدم RxList لتحديث الواجهة تلقائياً)
  var notifications = <NotificationModel>[
    NotificationModel(
      title: "Buy one Get 200gm Free",
      body: "BUY 1 Get 1 Free for small sizes until Mar 22 2022",
      time: "Today",
     // image: "assets/images/med1.png",
    ),
  ].obs;

  // دالة تُستدعى عند وصول طلب شراء جديد من مستخدم
  void receiveNewOrderNotification(String userName, String medicationName) {
    notifications.insert(0, NotificationModel(
      title: "طلب شراء جديد!",
      body: "قام $userName بطلب $medicationName الآن.",
      time: "Just now",
    ));
    
    // إظهار رسالة علوية (Snackbar) عند وصول الإشعار
    Get.snackbar(
      "إشعار جديد",
      "لديك طلب شراء جديد من $userName",
      snackPosition: SnackPosition.TOP,
      duration: Duration(seconds: 4),
    );
  }

  // دالة لتفريغ قائمة الإشعارات عند الضغط على Skip
void clearAllNotifications() {
  notifications.clear(); // سيؤدي هذا لتحديث الواجهة فوراً وظهور شاشة فارغة
}
}