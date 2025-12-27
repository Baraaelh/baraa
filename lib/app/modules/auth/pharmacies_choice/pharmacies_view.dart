// // lib/app/modules/pharmacy/pharmacy_list/pharmacy_list_view.dart

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:project/app/modules/auth/Widget/common_bottom_nav.dart';
// import 'package:project/app/modules/auth/pharmacies_choice/PharmacyModel.dart';
// import 'package:project/app/modules/auth/pharmacies_choice/pharmacies_controller.dart';
// // تأكد من صحة مسار ملف الـ CustomScaffold في مشروعك
 
// class PharmacyListView extends GetView<PharmacyListController> {
//   const PharmacyListView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const Color primaryGreen = Color(0xFF58A67E);

//     // نستخدم CustomScaffold لضمان ظهور الشريط السفلي وتفعيل أيقونة الصيدلية (اندكس 1)
//     return CustomScaffold(
//       index: 1, // الاندكس الخاص بأيقونة "الصيدليات"
//       body: Column(
//         children: [
//           // 1. شريط البحث والفلترة (تم وضعه داخل Column ليتحرك مع السكرول في CustomScaffold)
//           _buildSearchSection(primaryGreen),

//           // 2. قائمة الصيدليات
//           Obx(() {
//             if (controller.isLoading.value) {
//               return const Center(
//                 child: Padding(
//                   padding: EdgeInsets.all(50.0),
//                   child: CircularProgressIndicator(color: primaryGreen),
//                 ),
//               );
//             }

//             if (controller.filteredPharmacies.isEmpty) {
//               return const Center(
//                 child: Padding(
//                   padding: EdgeInsets.all(50.0),
//                   child: Text("لا توجد نتائج للبحث"),
//                 ),
//               );
//             }

//             // ملاحظة: بما أن CustomScaffold يستخدم SingleChildScrollView، 
//             // يجب أن نستخدم ListView.builder مع shrinkWrap و physics
//             return ListView.builder(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               itemCount: controller.filteredPharmacies.length,
//               itemBuilder: (context, index) {
//                 final pharmacy = controller.filteredPharmacies[index];
//                 return _buildPharmacyCard(pharmacy, primaryGreen);
//               },
//             );
//           }),
//         ],
//       ),
//     );
//   }

//   // --- دوال بناء الـ UI المساعدة ---

//   Widget _buildSearchSection(Color primaryGreen) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Row(
//         children: [
//           Container(
//             padding: const EdgeInsets.all(12),
//             decoration: BoxDecoration(
//               color: primaryGreen,
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: const Icon(Icons.tune, color: Colors.white),
//           ),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(12),
//                 boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
//               ),
//               child: TextField(
//                 onChanged: (value) => controller.filterSearch(value),
//                 decoration: const InputDecoration(
//                   hintText: 'ابحث عن صيدلية أو دواء...',
//                   prefixIcon: Icon(Icons.search, color: Colors.grey),
//                   border: InputBorder.none,
//                   contentPadding: EdgeInsets.symmetric(vertical: 15),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildPharmacyCard(PharmacyModel pharmacy, Color color) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(15),
//         boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 5))],
//       ),
//       child: InkWell(
//         onTap: () => controller.selectPharmacy(pharmacy),
//         borderRadius: BorderRadius.circular(15),
//         child: Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: Row(
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(12),
//                 child: Image.asset(
//                   pharmacy.image,
//                   width: 70, height: 70, fit: BoxFit.cover,
//                   errorBuilder: (context, error, stack) => Container(
//                     width: 70, height: 70, color: color.withOpacity(0.1),
//                     child: Icon(Icons.local_pharmacy, color: color),
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 15),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(pharmacy.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
//                     const SizedBox(height: 4),
//                     Row(
//                       children: [
//                         const Icon(Icons.location_on, size: 14, color: Colors.grey),
//                         const SizedBox(width: 4),
//                         Expanded(
//                           child: Text(
//                             pharmacy.address, 
//                             style: const TextStyle(color: Colors.grey, fontSize: 13), 
//                             overflow: TextOverflow.ellipsis
//                           )
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// lib/app/modules/pharmacy/pharmacy_list/pharmacy_list_view.dart
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/modules/auth/pharmacies_choice/pharmacies_controller.dart';
 import '../pharmacy_register/PharmacyRegisterModel.dart'; // الموديل الموحد الجديد
import '../../auth/Widget/common_bottom_nav.dart'; 

class PharmacyListView extends GetView<PharmacyListController> {
  const PharmacyListView({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryGreen = Color(0xFF58A67E);

    return CustomScaffold(
      index: 1, 
      body: SingleChildScrollView( // أضفنا سكرول خارجي لتجنب مشاكل المساحة
        child: Column(
          children: [
            _buildSearchSection(primaryGreen),

            Obx(() {
              if (controller.isLoading.value) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(100.0),
                    child: CircularProgressIndicator(color: primaryGreen),
                  ),
                );
              }

              if (controller.filteredPharmacies.isEmpty) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Column(
                      children: [
                        Icon(Icons.search_off, size: 64, color: Colors.grey[400]),
                        const SizedBox(height: 16),
                        const Text(
                          "لا توجد صيدليات متاحة حالياً",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                );
              }

              return ListView.builder(
                shrinkWrap: true, 
                physics: const NeverScrollableScrollPhysics(), 
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: controller.filteredPharmacies.length,
                itemBuilder: (context, index) {
                  final pharmacy = controller.filteredPharmacies[index];
                  return _buildPharmacyCard(pharmacy, primaryGreen);
                },
              );
            }),
            
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchSection(Color primaryGreen) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: primaryGreen,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.tune, color: Colors.white),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  )
                ],
              ),
              child: TextField(
                controller: controller.searchController,
                onChanged: (value) => controller.filterSearch(value),
                decoration: const InputDecoration(
                  hintText: 'ابحث عن صيدلية أو دواء...',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // تم تغيير نوع المعطى إلى PharmacyRegisterModel
  Widget _buildPharmacyCard(PharmacyRegisterModel pharmacy, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: InkWell(
        onTap: () => controller.selectPharmacy(pharmacy),
        borderRadius: BorderRadius.circular(15),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
                        Hero(
              tag: 'pharmacy_img_${pharmacy.uid}',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: (pharmacy.image != null && pharmacy.image!.isNotEmpty)
                    ? (pharmacy.image!.contains('assets') 
                        ? Image.asset(pharmacy.image!, width: 80, height: 80, fit: BoxFit.cover)
                        : Image.file(File(pharmacy.image!), width: 80, height: 80, fit: BoxFit.cover))
                    : Container(
                        width: 80,
                        height: 80,
                        color: color.withOpacity(0.1),
                        child: Icon(Icons.local_pharmacy, color: color, size: 30),
                      ),
              ),
            ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pharmacy.namePharmacy, // استخدام اسم الصيدلية التجاري
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(Icons.location_on, size: 14, color: Colors.grey),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            pharmacy.address,
                            style: const TextStyle(color: Colors.grey, fontSize: 13),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "${pharmacy.medicines.length} أدوية متوفرة",
                        style: TextStyle(
                          color: color,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}