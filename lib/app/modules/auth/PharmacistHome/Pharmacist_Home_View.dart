// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:project/app/modules/auth/PharmacistHome/Pharmacist_Home_Controller.dart';

// class PharmacistHomeView extends GetView<PharmacistHomeController> {
//   const PharmacistHomeView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // 1. خلفية الصفحة سكني خفيف جداً
//       backgroundColor: const Color(0xFFF8F8F8), 
//       body: SafeArea(
//         child: Column(
//           children: [
//             // 2. الهيدر المخصص (الخلفية بيضاء مع Padding)
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(20),
//                   bottomRight: Radius.circular(20),
//                 ),
//               ),
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       CircleAvatar(
//                         radius: 25,
//                         backgroundColor: const Color(0xFFE0E0E0),
//                         backgroundImage: controller.currentPharmacy.image.isEmpty
//                             ? const AssetImage('assets/images/Rectangle17.png') as ImageProvider
//                             : (controller.currentPharmacy.image.contains('assets')
//                                 ? AssetImage(controller.currentPharmacy.image)
//                                 : FileImage(File(controller.currentPharmacy.image)) as ImageProvider),
//                       ),
//                       const SizedBox(width: 12),
//                       const Text(
//                         "مرحباً",
//                         style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
//                       ),
//                       const Spacer(),
//                       // الأيقونات الثلاثة
//                       _buildActionIcon(Icons.notifications_none, () {}),
//                       _buildActionIcon(Icons.person_outline, () {}),
//                       _buildActionIcon(Icons.logout, () => Get.offAllNamed('/register')),
//                     ],
//                   ),
//                   const SizedBox(height: 20),
//                   // 3. حقل البحث باللون الأخضر
//                   TextField(
//                     decoration: InputDecoration(
//                       hintText: 'Search',
//                       hintStyle: const TextStyle(color: Color(0xFF59A985)), // نص أخضر
//                       prefixIcon: const Icon(Icons.search, color: Color(0xFF59A985)), // أيقونة خضراء
//                       suffixIcon: const Icon(Icons.mic, color: Color(0xFF59A985)),
//                       filled: true,
//                       fillColor: const Color(0xFFF1F1F1),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(15),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             // 4. محتوى الصفحة القابل للتمرير
//             Expanded(
//               child: SingleChildScrollView(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: Column(
//                   children: [
//                     // مسافة لدفع الكرت لمنتصف الشاشة تقريباً
//                     const SizedBox(height: 80), 

//                     // كرت الصيدلية الرئيسي
//                     Container(
//                       decoration: BoxDecoration(
//                         color: const Color(0xFFE9F5EE),
//                         borderRadius: BorderRadius.circular(30),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.05),
//                             blurRadius: 10,
//                             offset: const Offset(0, 5),
//                           )
//                         ],
//                       ),
//                       padding: const EdgeInsets.all(20),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(20),
//                             child: Image.asset(
//                               'assets/images/Rectangle 11.png',
//                               width: double.infinity,
//                               height: 180,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           const SizedBox(height: 20),
//                           Text(
//                             "${controller.currentPharmacy.name} Pharmacy",
//                             style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
//                           ),
//                           const SizedBox(height: 10),
//                           Text(
//                             "Welcome to your local and trusted pharmacy, dedicated to providing the right treatment and medications around the clock.",
//                             style: TextStyle(color: Colors.grey[600], fontSize: 14, height: 1.5),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 30),
                    
//                     // زر الإضافة (يمكنك تفعيله هنا إذا أردت)
//                  //   _buildAddButton(controller),
                    
//                     const SizedBox(height: 40),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: _buildBottomNav(),
//     );
//   }

//   // أداة مساعدة لبناء أيقونات الأكشن
//   Widget _buildActionIcon(IconData icon, VoidCallback onTap) {
//     return IconButton(
//       visualDensity: VisualDensity.compact,
//       icon: Icon(icon, color: Colors.black, size: 26),
//       onPressed: onTap,
//     );
//   }

//   // أداة مساعدة لبناء زر الإضافة
//   // Widget _buildAddButton(PharmacistHomeController controller) {
//   //   return SizedBox(
//   //     width: double.infinity,
//   //     height: 55,
//   //     child: ElevatedButton(
//   //       onPressed: () => controller.navigateToAddMedication(),
//   //       style: ElevatedButton.styleFrom(
//   //         backgroundColor: const Color(0xFF59A985),
//   //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//   //       ),
//   //       child: const Text("Add medicine", style: TextStyle(color: Colors.white, fontSize: 18)),
//   //     ),
//   //   );
//   // }

//   Widget _buildBottomNav() {
//     return BottomNavigationBar(
//       elevation: 20,
//       backgroundColor: Colors.white,
//       selectedItemColor: const Color(0xFF59A985),
//       unselectedItemColor: Colors.grey,
//       showSelectedLabels: true,
//       items: const [
//         BottomNavigationBarItem(icon: Icon(Icons.home_outlined, size: 30), label: 'Home'),
//         BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined, size: 30), label: 'Cart'),
//         BottomNavigationBarItem(icon: Icon(Icons.bar_chart_outlined, size: 30), label: 'Stock'),
//       ],
//     );
//   }
// }



import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/modules/auth/PharmacistHome/Pharmacist_Home_Controller.dart';
import 'package:project/app/modules/auth/Widget2/common_bottom_nav1.dart';

class PharmacistHomeView extends GetView<PharmacistHomeController> {
  const PharmacistHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return PharmacistScaffold(
      index: 0,
      body: SafeArea(
        // استخدمنا Obx هنا لأن البيانات تأتي من AuthService وقد تتأخر قليلاً
        child: Obx(() {
          // فحص أمان: إذا لم تكن البيانات قد وصلت بعد
          if (controller.currentPharmacy.value == null) {
            return const Center(child: CircularProgressIndicator(color: Color(0xFF59A985)));
          }

          return Column(
            children: [
              _buildWhiteHeader(context),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      _buildPharmacyCard(),
                      const SizedBox(height: 30),
                      _buildAddMedicineButton(),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildWhiteHeader(BuildContext context) {
    final pharmacy = controller.currentPharmacy.value!;
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 25),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 5, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              // صورة البروفايل (معالجة ذكية للصورة)
              CircleAvatar(
                radius: 25,
                backgroundColor: const Color(0xFFF1F1F1),
                backgroundImage: _getProfileImage(pharmacy.image),
              ),
              const SizedBox(width: 12),
              Text(
                "مرحباً بك، ${pharmacy.name}", // عرض اسم الصيدلي
                style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              _buildAppBarIcon(Icons.notifications_none, onTap: () => controller.goToNotifications()),
              _buildAppBarIcon(Icons.person_outline),
              _buildAppBarIcon(Icons.logout, onTap: () => controller.showLogoutDialog()),
            ],
          ),
          const SizedBox(height: 25),
          _buildSearchField(),
        ],
      ),
    );
  }

  // دالة مساعدة لجلب الصورة سواء كانت Asset أو File أو Default
  ImageProvider _getProfileImage(String? imagePath) {
    if (imagePath == null || imagePath.isEmpty) {
      return const AssetImage('assets/images/Rectangle17.png');
    }
    if (imagePath.contains('assets')) {
      return AssetImage(imagePath);
    }
    return FileImage(File(imagePath));
  }

  Widget _buildSearchField() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search medication...',
        hintStyle: const TextStyle(color: Color(0xFF59A985)),
        prefixIcon: const Icon(Icons.search, color: Color(0xFF59A985)),
        suffixIcon: const Icon(Icons.mic, color: Color(0xFF59A985)),
        filled: true,
        fillColor: const Color(0xFFF5F5F5),
        contentPadding: const EdgeInsets.symmetric(vertical: 15),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
      ),
    );
  }

  Widget _buildPharmacyCard() {
    final pharmacy = controller.currentPharmacy.value!;
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFE9F5EE),
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/images/Rectangle 11.png', 
              width: double.infinity,
              height: 180,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            pharmacy.namePharmacy, // اسم الصيدلية الموحد
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(height: 10),
          Text(
            "Welcome to ${pharmacy.namePharmacy}, dedicated to providing the right treatment and medications around the clock.",
            style: TextStyle(color: Colors.grey[700], fontSize: 14, height: 1.5),
          ),
        ],
      ),
    );
  }

  Widget _buildAddMedicineButton() {
  return Container(
    width: double.infinity,
    height: 60, // زيادة الارتفاع قليلاً للفخامة
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(18),
      gradient: const LinearGradient(
        colors: [Color(0xFF59A985), Color(0xFF4A8B6D)], // تدرج لوني أخضر
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      boxShadow: [
        BoxShadow(
          color: const Color(0xFF59A985).withOpacity(0.3),
          blurRadius: 12,
          offset: const Offset(0, 6), // ظل سفلي يعطي عمق
        ),
      ],
    ),
    child: ElevatedButton(
      onPressed: () => controller.navigateToAddMedication(),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent, // شفاف ليظهر التدرج
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.add_circle_outline, color: Colors.white, size: 24),
          SizedBox(width: 10),
          Text(
            "Add medicine",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    ),
  );
}

  Widget _buildAppBarIcon(IconData icon, {VoidCallback? onTap}) {
    return IconButton(
      onPressed: onTap ?? () {},
      icon: Icon(icon, color: Colors.black87, size: 26),
      visualDensity: VisualDensity.compact,
    );
  }
}