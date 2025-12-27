import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/modules/auth/Widget/main_layout_controller.dart';
 
class CustomScaffold extends StatelessWidget {
  final Widget body;
  final int index;
// ✅ الطريقة الصحيحة
const CustomScaffold({super.key, required this.body, required this.index});
  // const CustomScaffold(set, {super.key, required this.body, required this.index});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MainLayoutController>();
    
    // تحديث الاندكس عند فتح الصفحة لضمان بقاء الأيقونة مفعلة
    controller.currentIndex.value = index;

    return Scaffold(
      backgroundColor: Colors.white,
      // SingleChildScrollView هنا يحل مشكلة الـ Overflow الظاهرة في الصورة
      body: SafeArea(child: SingleChildScrollView(child: body)),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        currentIndex: controller.currentIndex.value,
        onTap: (i) => controller.changePage(i),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF388E3C),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
          BottomNavigationBarItem(icon: Icon(Icons.local_pharmacy), label: 'الصيدليات'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'الدردشة'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'بروفايل'),
        ],
      )),
    );
  }
}