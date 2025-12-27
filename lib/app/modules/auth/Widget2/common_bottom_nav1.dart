import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/modules/auth/Widget2/main_layout_controller1.dart';
 
class PharmacistScaffold extends StatelessWidget {
  final Widget body;
  final int index;

  const PharmacistScaffold({super.key, required this.body, required this.index});

  @override
  Widget build(BuildContext context) {
    // التأكد من وجود الكنترولر وحقنه إذا لم يكن موجوداً
    final controller = Get.put(MainLayoutController1(), permanent: true);
    
    // تحديث الاندكس ليبقى متوافقاً مع الصفحة المفتوحة
    controller.currentIndex.value = index;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8), // خلفية سكنية خفيفة كما طلبت
      body: body, // الـ body سيمرر من كل صفحة (Home, Cart, Stock)
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        currentIndex: controller.currentIndex.value,
        onTap: (i) => controller.changePage(i),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF59A985), // اللون الأخضر الخاص بك
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart_outlined), label: 'Stock'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
        ],
      )),
    );
  }
}