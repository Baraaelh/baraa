// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:project/app/modules/auth/AddMedicine/AddMedicine_Controller.dart';
// import 'package:project/app/modules/auth/AddMedicine/Medicine_Model.dart';
  

// class AddMedicationListView extends StatelessWidget {
//   const AddMedicationListView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // حقن الكنترولر
//     final controller = Get.put(AddMedicationListController());

//     return Scaffold(
//       backgroundColor: Colors.white, // خلفية بيضاء
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
//           onPressed: () => Get.back(),
//         ),
//         centerTitle: true,
//         title: const Text(
//           "Add medication",
//           style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
//         ),
//       ),
//       body: CustomScrollView(
//         physics: const BouncingScrollPhysics(),
//         slivers: [
//           // 1. صورة البانر العلوية
//           SliverToBoxAdapter(
//             child: Container(
//               margin: const EdgeInsets.all(20),
//               height: 150,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 image: const DecorationImage(
//                   image: AssetImage('images/pharmacy_banner.png'), // ضع صورة مناسبة هنا
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               child: Container(
//                 alignment: Alignment.centerLeft,
//                 padding: const EdgeInsets.all(20),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   gradient: LinearGradient(
//                     colors: [Colors.black.withOpacity(0.4), Colors.transparent],
//                     begin: Alignment.bottomCenter,
//                     end: Alignment.topCenter,
//                   ),
//                 ),
//                 child: const Text(
//                   "Pharmaceutical\nproducts and prices",
//                   style: TextStyle(
//                     color: Colors.black, // حسب الصورة النص أسود لكن الخلفية قد تحتاج تفتيح
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ),

//           // 2. شبكة المنتجات (Grid)
//           SliverPadding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             sliver: SliverGrid(
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2, // عمودين
//                 childAspectRatio: 0.65, // نسبة الطول للعرض (لجعل الكرت طويلاً)
//                 mainAxisSpacing: 15,
//                 crossAxisSpacing: 15,
//               ),
//               delegate: SliverChildBuilderDelegate(
//                 (context, index) {
//                   return _buildMedicineCard(controller.catalogMedicines[index], controller);
//                 },
//                 childCount: controller.catalogMedicines.length,
//               ),
//             ),
//           ),
          
//           // مسافة سفلية
//           const SliverToBoxAdapter(child: SizedBox(height: 30)),
//         ],
//       ),
//     );
//   }

//   // تصميم الكرت الواحد
//   Widget _buildMedicineCard(MedicineModel med, AddMedicationListController controller) {
//     return Container(
//       padding: const EdgeInsets.all(10),
//       decoration: BoxDecoration(
//         color: const Color(0xFFE9F5EE), // الخلفية الخضراء الفاتحة
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // الصورة
//           Expanded(
//             flex: 3,
//             child: Center(
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(15),
//                 child: Image.asset(
//                   med.image.isNotEmpty ? med.image : 'assets/images/Rectangle 11.png', 
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: 10),
          
//           // الاسم والسعر
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Expanded(
//                 child: Text(
//                   med.name,
//                   style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ),
//               Text(
//                 "${med.price.toInt()}\$",
//                 style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
//               ),
//             ],
//           ),
          
//           // الوصف المختصر
//           const SizedBox(height: 5),
//           Text(
//             med.description,
//             style: TextStyle(color: Colors.grey[700], fontSize: 10),
//             maxLines: 2,
//             overflow: TextOverflow.ellipsis,
//           ),

//           const SizedBox(height: 10),

//           // أزرار التحكم بالكمية وزر الإضافة
//           // ( - ) 2 ( + )
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               // المخزون الحالي (مجرد رقم للعرض)
//               Text(
//                 "${med.quantity}",
//                 style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
//               ),
              
//               // العداد وزر الإضافة
//               Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
//                 child: Row(
//                   children: [
//                     _buildMiniButton(Icons.remove, () => controller.decrementQuantity(med.id)),
                    
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 8),
//                       child: Obx(() => Text(
//                         "${controller.selectedQuantities[med.id]!.value}",
//                         style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF59A985)),
//                       )),
//                     ),
                    
//                     // زر الزائد (+) هنا يعمل لزيادة العداد
//                     _buildMiniButton(Icons.add, () => controller.incrementQuantity(med.id)),
//                   ],
//                 ),
//               ),
//             ],
//           ),
          
//           const SizedBox(height: 10),
          
//           // زر "إضافة للمخزن" (Add to Stock)
//           SizedBox(
//             width: double.infinity,
//             height: 35,
//             child: ElevatedButton.icon(
//               onPressed: () => controller.addMedicineToMyStock(med),
//               icon: const Icon(Icons.add_shopping_cart, size: 16, color: Colors.white),
//               label: const Text("Add", style: TextStyle(color: Colors.white, fontSize: 12)),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color(0xFF59A985),
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                 padding: EdgeInsets.zero,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // زر صغير (+ / -)
//   Widget _buildMiniButton(IconData icon, VoidCallback onTap) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.all(2),
//         decoration: const BoxDecoration(
//           shape: BoxShape.circle,
//           color: Color(0xFFE9F5EE),
//         ),
//         child: Icon(icon, size: 16, color: const Color(0xFF59A985)),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:project/app/modules/auth/AddMedicine/AddMedicine_Controller.dart';
// import 'package:project/app/modules/auth/AddMedicine/Medicine_Model.dart';
 
// class AddMedicationListView extends StatelessWidget {
//   const AddMedicationListView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(AddMedicationListController());

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
//           onPressed: () => Get.back(),
//         ),
//         centerTitle: true,
//         title: const Text(
//           "Add medication",
//           style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
//         ),
//       ),
//       body: CustomScrollView(
//         physics: const BouncingScrollPhysics(),
//         slivers: [
//           SliverToBoxAdapter(
//             child: _buildBanner(),
//           ),
//           SliverPadding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             sliver: SliverGrid(
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 childAspectRatio: 0.62,
//                 mainAxisSpacing: 15,
//                 crossAxisSpacing: 15,
//               ),
//               delegate: SliverChildBuilderDelegate(
//                 (context, index) {
//                   return _buildMedicineCard(controller.catalogMedicines[index], controller);
//                 },
//                 childCount: controller.catalogMedicines.length,
//               ),
//             ),
//           ),
//           const SliverToBoxAdapter(child: SizedBox(height: 30)),
//         ],
//       ),
//     );
//   }

//   Widget _buildBanner() {
//     return Container(
//       margin: const EdgeInsets.all(20),
//       height: 150,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         image: const DecorationImage(
//           image: AssetImage('assets/images/pharmacy_banner.png'), // تأكد من المسار
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: Container(
//         alignment: Alignment.centerLeft,
//         padding: const EdgeInsets.all(20),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           gradient: LinearGradient(
//             colors: [Colors.black.withOpacity(0.6), Colors.transparent],
//             begin: Alignment.bottomCenter,
//             end: Alignment.topCenter,
//           ),
//         ),
//         child: const Text(
//           "Pharmaceutical\nProducts",
//           style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }

//   Widget _buildMedicineCard(MedicineModel med, AddMedicationListController controller) {
//     return Container(
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: const Color(0xFFE9F5EE),
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(
//             child: Center(
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(15),
//                 child: Image.asset(
//                   med.image.isNotEmpty ? med.image : 'assets/images/med1.png',
//                   fit: BoxFit.contain,
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: 10),
//           Text(
//             med.name,
//             style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,
//           ),
//           Text(
//             "${med.price.toInt()}\$",
//             style: const TextStyle(color: Color(0xFF59A985), fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
          
//           // صف التحكم بالكمية
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Text("Qty:", style: TextStyle(fontSize: 12, color: Colors.grey)),
//               Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 child: Row(
//                   children: [
//                     _buildQtyBtn(Icons.remove, () => controller.decrementQuantity(med.id)),
//                     Obx(() => Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 8),
//                       child: Text("${controller.selectedQuantities[med.id]!.value}",
//                         style: const TextStyle(fontWeight: FontWeight.bold)),
//                     )),
//                     _buildQtyBtn(Icons.add, () => controller.incrementQuantity(med.id)),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 12),
          
//           // زر الإضافة النهائي
//           SizedBox(
//             width: double.infinity,
//             height: 35,
//             child: ElevatedButton(
//               onPressed: () => controller.addMedicineToMyStock(med),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color(0xFF59A985),
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                 elevation: 0,
//               ),
//               child: const Text("Add to Stock", style: TextStyle(color: Colors.white, fontSize: 11)),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildQtyBtn(IconData icon, VoidCallback onTap) {
//     return InkWell(
//       onTap: onTap,
//       child: Padding(
//         padding: const EdgeInsets.all(4.0),
//         child: Icon(icon, size: 18, color: const Color(0xFF59A985)),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/modules/auth/AddMedicine/AddMedicine_Controller.dart';
import 'package:project/app/modules/auth/AddMedicine/Medicine_Model.dart';
 
class AddMedicationListView extends StatelessWidget {
  const AddMedicationListView({super.key});

  @override
  Widget build(BuildContext context) {
    // استخدام Get.put لإنشاء الكنترولر عند فتح الصفحة
    final controller = Get.put(AddMedicationListController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
        title: const Text(
          "Add medication",
          style: TextStyle(
            color: Colors.black, 
            fontWeight: FontWeight.bold, 
            fontSize: 18
          ),
        ),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // 1. البانر العلوي
          SliverToBoxAdapter(
            child: _buildBanner(),
          ),

          // 2. شبكة الأدوية
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.62,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final med = controller.catalogMedicines[index];
                  return _buildMedicineCard(med, controller);
                },
                childCount: controller.catalogMedicines.length,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 30)),
        ],
      ),
    );
  }

  // تصميم البانر
  Widget _buildBanner() {
    return Container(
      margin: const EdgeInsets.all(20),
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: AssetImage('assets/images/pharmacy_banner.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [Colors.black.withOpacity(0.6), Colors.transparent],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: const Text(
          "Pharmaceutical\nProducts",
          style: TextStyle(
            color: Colors.white, 
            fontSize: 22, 
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }

  // تصميم كرت الدواء مع Obx للعداد
  Widget _buildMedicineCard(MedicineModel med, AddMedicationListController controller) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFE9F5EE),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // صورة المنتج
          Expanded(
            child: Center(
              child: Image.asset(
                med.image.isNotEmpty ? med.image : 'assets/images/med1.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 10),
          
          // الاسم والسعر
          Text(
            med.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            "${med.price.toInt()}\$",
            style: const TextStyle(
              color: Color(0xFF59A985), 
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 10),
          
          // تحكم الكمية (العداد) باستخدام Obx
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Qty:", style: TextStyle(fontSize: 12, color: Colors.grey)),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    _buildQtyBtn(Icons.remove, () => controller.decrementQuantity(med.id)),
                    
                    // هنا نستخدم Obx لمراقبة تغير رقم الكمية لهذا الدواء تحديداً
                    Obx(() => Container(
                      constraints: const BoxConstraints(minWidth: 25),
                      alignment: Alignment.center,
                      child: Text(
                        "${controller.selectedQuantities[med.id]?.value ?? 1}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )),
                    
                    _buildQtyBtn(Icons.add, () => controller.incrementQuantity(med.id)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          
          // زر الإضافة النهائي للمخزن
          SizedBox(
            width: double.infinity,
            height: 38,
            child: ElevatedButton(
              onPressed: () => controller.addMedicineToMyStock(med),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF59A985),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                elevation: 0,
              ),
              child: const Text(
                "Add to Stock", 
                style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ويدجت زر العداد الصغير
  Widget _buildQtyBtn(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Icon(icon, size: 18, color: const Color(0xFF59A985)),
      ),
    );
  }
}