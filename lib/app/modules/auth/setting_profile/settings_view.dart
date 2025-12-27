// lib/app/modules/settings/views/settings_view.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/modules/auth/Widget/common_bottom_nav.dart';
import 'package:project/app/modules/auth/setting_profile/settings_controller.dart';
// تأكد من صحة هذه المسارات حسب مشروعك
 
class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      index: 3, // ترتيب صفحة البروفايل في الشريط السفلي
      body: Directionality(
        textDirection: TextDirection.rtl, // لضمان ظهور النصوص والأيقونات بالاتجاه العربي الصحيح
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              
              // 1. قسم رأس الصفحة (الصورة والاسم ومستخد جديد)
              _buildHeader(),
              
              const SizedBox(height: 30),
              
              // 2. قسم العناوين المسجلة (الروابط الوظيفية)
              _buildSectionTitle("العناوين المسجلة"),
              _buildMenuCard([
                _buildMenuItem(
                  Icons.lock_outline, 
                  "تغيير كلمة المرور", 
                  onTap: () => Get.toNamed('/change_password_view'),
                ),
                _buildMenuItem(
                  Icons.chat_outlined, 
                  "استشارة الطبيب", 
                  onTap: () => Get.toNamed('/doctor-consultation'),
                ),
                _buildMenuItem(
                  Icons.shopping_basket_outlined, 
                  "طلباتي", 
                  onTap: () => Get.toNamed('/my-orders'),
                ),
                _buildMenuItem(
                  Icons.favorite_border, 
                  "المفضلة", 
                  onTap: () => Get.toNamed('/favorites'),
                ),
              ]),

              const SizedBox(height: 20),

              // 3. قسم الإعدادات (روابط إضافية)
              _buildSectionTitle("الاعدادات"),
              _buildMenuCard([
                _buildMenuItem(
                  Icons.share_outlined, 
                  "شارك التطبيق", 
                  color: Colors.green, 
                  //onTap: () => controller.shareApp(),
                  onTap: () => Get.toNamed('/rate-us'),
                ),
                _buildMenuItem(
                  Icons.star_border, 
                  "قيمنا", 
                  color: Colors.green, 
                  onTap: () => Get.toNamed('/rate-us'),
                ),
                _buildMenuItem(
                  Icons.info_outline, 
                  "عن التطبيق", 
                  color: Colors.green, 
                  onTap: () => Get.toNamed('/about-app'),
                ),
                _buildMenuItem(
                  Icons.error_outline, 
                  "سياسة الخصوصية", 
                  color: Colors.green, 
                  onTap: () => Get.toNamed('/privacy-policy'),
                ),
              ]),

              const SizedBox(height: 30),

              // 4. زر تسجيل الخروج
              _buildLogoutButton(),
              
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  // --- دالة بناء رأس الصفحة (الصورة والاسم) ---
  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // اليمين: الصورة والمعلومات
          Row(
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/images/user_avatar.png'),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "براء الحداد",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2D6A4F),
                    ),
                  ),
                  Text(
                    "تعديل الملف الشخصي",
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
          // اليسار: حالة المستخدم
          const Text(
            "مستخدم جديد",
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  // --- دالة بناء عنوان القسم ---
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(right: 25, bottom: 10),
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          title, 
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  // --- دالة بناء البطاقة التي تحتوي العناصر ---
  Widget _buildMenuCard(List<Widget> items) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(children: items),
    );
  }

  // --- دالة بناء العنصر الواحد في القائمة ---
  Widget _buildMenuItem(IconData icon, String title, {Color color = Colors.black54, VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: color, size: 26),
      title: Text(
        title, 
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.green),
      onTap: onTap,
    );
  }

  // --- دالة بناء زر تسجيل الخروج ---
  Widget _buildLogoutButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: InkWell(
        onTap: () => controller.logout(),
        child: Row(
          children: [
            // الأيقونة الحمراء في اليمين
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.logout, color: Colors.red),
            ),
            const SizedBox(width: 15),
            // النص الأحمر
            const Text(
              "تسجيل الخروج", 
              style: TextStyle(
                color: Colors.red, 
                fontSize: 18, 
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            // السهم في أقصى اليسار
            const Icon(Icons.arrow_back_ios_new, size: 16, color: Colors.green),
          ],
        ),
      ),
    );
  }
}