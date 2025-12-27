import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/modules/auth/Notification/Notification_Controller.dart';
import 'package:project/app/modules/auth/Notification/Notification_Model.dart';

class NotificationsView extends GetView<NotificationController> {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text("Notifications", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
       // داخل NotificationsView
actions: [
  TextButton(
    onPressed: () => controller.clearAllNotifications(), 
    child: const Text(
      "Skip", 
      style: TextStyle(color: Colors.black, fontSize: 16)
    )
  ),
],
      ),
      body: Obx(() => ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: controller.notifications.length,
        itemBuilder: (context, index) {
          final item = controller.notifications[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (index == 0) const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Text("Today", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              _buildNotificationCard(item),
            ],
          );
        },
      )),
    );
  }

  Widget _buildNotificationCard(NotificationModel item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFE9F5EE), // اللون الأخضر الفاتح
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: item.image != null 
              ? Image.asset(item.image!, width: 60, height: 60, fit: BoxFit.cover)
              : Container(width: 60, height: 60, color: Colors.white, child: const Icon(Icons.shopping_bag, color: Color(0xFF59A985))),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 4),
                Text(item.body, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                const SizedBox(height: 4),
                Text("until ${item.time}", style: const TextStyle(color: Colors.grey, fontSize: 10)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}