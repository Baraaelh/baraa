// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:project/app/modules/auth/Cart/Cart_Controller.dart';
// import 'package:project/app/modules/auth/PharmacyDetails/Pharmacy_Details_Controller.dart';
//  class CartView extends GetView<CartController> {
//   @override
  
//   const CartView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final detailsController = Get.find<PharmacyDetailsController>();
//     final cartController = Get.put(CartController());
 
//     const Color primaryGreen = Color(0xFF58A67E);

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: const Text('سلة المشتريات', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
//           onPressed: () => Get.back(),
//         ),
//       ),
//       body: Obx(() {
//         if (controller.cartItems.isEmpty) {
//           return const Center(child: Text("السلة فارغة حالياً"));
//         }
//         return Column(
//           children: [
//             Expanded(
//               child: ListView.builder(
//                 itemCount: controller.cartItems.length,
//                 itemBuilder: (context, index) {
//                   final item = controller.cartItems[index];
//                   return _buildCartItem(item, primaryGreen);
//                 },
//               ),
//             ),
//             _buildBottomSummary(primaryGreen),
//           ],
//         );
//       }),
//     );
//   }

//   Widget _buildCartItem(item, color) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: const Color(0xFFF9F9F9),
//         borderRadius: BorderRadius.circular(15),
//       ),
//       child: Row(
//         children: [
//           // التحكم بالكمية أو زر الحذف
//           IconButton(
//             icon: const Icon(Icons.remove_circle_outline, color: Colors.redAccent),
//             onPressed: () => controller.removeProduct(item),
//           ),
//           const Text("1", style: TextStyle(fontWeight: FontWeight.bold)),
//           const Icon(Icons.add_circle, color: Color(0xFF58A67E)),
          
//           const Spacer(),
          
//           // تفاصيل المنتج
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
//               Text('د.ك ${item.price}', style: TextStyle(color: color, fontWeight: FontWeight.bold)),
//             ],
//           ),
          
//           const SizedBox(width: 15),
          
//           // صورة المنتج
//           ClipRRect(
//             borderRadius: BorderRadius.circular(10),
//             child: Image.asset(item.image, width: 60, height: 60, fit: BoxFit.cover),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildBottomSummary(Color color) {
//     return Container(
//       padding: const EdgeInsets.all(25),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, spreadRadius: 5)],
//         borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
//       ),
//       child: Column(
//         children: [
//           _summaryRow("المبلغ", "${controller.subtotal.toStringAsFixed(3)} د.ك"),
//           _summaryRow("رسوم التوصيل", "${controller.deliveryFee.toStringAsFixed(3)} د.ك"),
//           const Padding(
//             padding: EdgeInsets.symmetric(vertical: 10),
//             child: Divider(),
//           ),
//           _summaryRow("الإجمالي", "${controller.total.toStringAsFixed(3)} د.ك", isBold: true),
//           const SizedBox(height: 20),
//           SizedBox(
//             width: double.infinity,
//             height: 55,
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: color,
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//               ),
//               onPressed: () => 
//               Get.toNamed('/checkout-address'), 
//               child: const Text("متابعة الشراء", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _summaryRow(String label, String value, {bool isBold = false}) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(value, style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal, fontSize: isBold ? 18 : 14)),
//         Text(label, style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal, fontSize: isBold ? 18 : 14, color: Colors.grey[700])),
//       ],
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:project/app/modules/auth/Cart/Cart_Controller.dart';
// import 'package:project/app/modules/auth/AddMedicine/Medicine_Model.dart'; // تأكد من استيراد الموديل

// class CartView extends GetView<CartController> {
//   const CartView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // الوصول للكنترولر الموجود مسبقاً في الذاكرة
//     final cartController = Get.find<CartController>();
//     const Color primaryGreen = Color(0xFF58A67E);

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: const Text('سلة المشتريات', 
//           style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
//           onPressed: () => Get.back(),
//         ),
//       ),
//       body: Obx(() {
//         if (cartController.cartItems.isEmpty) {
//           return const Center(
//             child: Text("السلة فارغة حالياً", style: TextStyle(fontSize: 16, color: Colors.grey)),
//           );
//         }
        
//         // --- جديد: تحويل القائمة لعناصر فريدة لعرضها بشكل مرتب في السلة ---
//         // بما أن القائمة قد تحتوي على نفس الدواء مكرر، نستخدم toSet لجعلها فريدة في العرض فقط
//         final uniqueItems = cartController.cartItems.toSet().toList();

//         return Column(
//           children: [
//             Expanded(
//               child: ListView.builder(
//                 itemCount: uniqueItems.length, // نستخدم العناصر الفريدة
//                 itemBuilder: (context, index) {
//                   final item = uniqueItems[index];
//                   return _buildCartItem(item, primaryGreen, cartController);
//                 },
//               ),
//             ),
//             _buildBottomSummary(primaryGreen, cartController),
//           ],
//         );
//       }),
//     );
//   }

//   Widget _buildCartItem(MedicineModel item, Color color, CartController controller) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: const Color(0xFFF9F9F9),
//         borderRadius: BorderRadius.circular(15),
//         boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 5)],
//       ),
//       child: Row(
//         children: [
//           // --- جديد: أزرار التحكم بالكمية ---
//           Column(
//             children: [
//               IconButton(
//                 icon: const Icon(Icons.add_circle, color: Color(0xFF58A67E)),
//                 onPressed: () => controller.addProduct(item), // إضافة عنصر جديد
//               ),
              
//               // --- جديد: حساب الكمية الحقيقية المضافة في السلة ---
//               Obx(() {
//                 // نحسب كم مرة تكرر هذا الـ id داخل قائمة السلة
//                 int count = controller.cartItems.where((p) => p.id == item.id).length;
//                 return Text("$count", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16));
//               }),

//               IconButton(
//                 icon: const Icon(Icons.remove_circle_outline, color: Colors.redAccent),
//                 onPressed: () => controller.removeProduct(item), // إزالة عنصر
//               ),
//             ],
//           ),
          
//           const Spacer(),
          
//           // --- جديد: تفاصيل المنتج (الاسم والسعر) ---
//           Expanded(
//             flex: 3,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 Text(item.name, 
//                   style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                   maxLines: 1, overflow: TextOverflow.ellipsis),
//                 const SizedBox(height: 4),
//                 Text('${item.price.toStringAsFixed(2)} د.ك', 
//                   style: TextStyle(color: color, fontWeight: FontWeight.bold)),
//               ],
//             ),
//           ),
          
//           const SizedBox(width: 15),
          
//           // --- جديد: عرض صورة المنتج المختارة ---
//           ClipRRect(
//             borderRadius: BorderRadius.circular(10),
//             child: item.image.contains('assets/') 
//               ? Image.asset(item.image, width: 65, height: 65, fit: BoxFit.cover)
//               // في حال كانت الصورة من ملف (كاميرا أو معرض)
//               : Image.network(item.image, width: 65, height: 65, fit: BoxFit.cover, 
//                   errorBuilder: (_, __, ___) => const Icon(Icons.medication, size: 60, color: Colors.grey)), 
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildBottomSummary(Color color, CartController controller) {
//     return Container(
//       padding: const EdgeInsets.all(25),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, spreadRadius: 5)],
//         borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
//       ),
//       child: Column(
//         children: [
//           // --- جديد: استدعاء المبالغ الحقيقية من الكنترولر ---
//           _summaryRow("المبلغ", "${controller.subtotal.toStringAsFixed(3)} د.ك"),
//           _summaryRow("رسوم التوصيل", "${controller.deliveryFee.toStringAsFixed(3)} د.ك"),
//           const Padding(
//             padding: EdgeInsets.symmetric(vertical: 10),
//             child: Divider(),
//           ),
//           _summaryRow("الإجمالي", "${controller.total.toStringAsFixed(3)} د.ك", isBold: true),
//           const SizedBox(height: 20),
//           SizedBox(
//             width: double.infinity,
//             height: 55,
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: color,
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//               ),
//               onPressed: () => Get.toNamed('/checkout-address'), 
//               child: const Text("متابعة الشراء", 
//                 style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _summaryRow(String label, String value, {bool isBold = false}) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(value, style: TextStyle(
//           fontWeight: isBold ? FontWeight.bold : FontWeight.normal, 
//           fontSize: isBold ? 18 : 14)),
//         Text(label, style: TextStyle(
//           fontWeight: isBold ? FontWeight.bold : FontWeight.normal, 
//           fontSize: isBold ? 18 : 14, color: Colors.grey[700])),
//       ],
//     );
//   }
// }


// lib/app/modules/cart/cart_view.dart
// lib/app/modules/cart/cart_view.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/modules/auth/Cart/Cart_Controller.dart';
 
class CartView extends GetView<CartController> {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    const Color green = Color(0xFF58A67E);

    return Scaffold(
      appBar: AppBar(
        title: const Text('سلة المشتريات'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.cartItems.isEmpty) {
          return const Center(child: Text('السلة فارغة'));
        }

        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: controller.cartItems.length,
                itemBuilder: (context, index) {
                  final item = controller.cartItems[index];
                  return _cartItem(item, green);
                },
              ),
            ),
            _summary(green),
          ],
        );
      }),
    );
  }

  Widget _cartItem(item, Color green) {
    return ListTile(
      leading: Image.asset(
        item.medicine.image,
        width: 50,
        errorBuilder: (_, __, ___) =>
            const Icon(Icons.medication, size: 40),
      ),
      title: Text(item.medicine.name),
      subtitle: Text('${item.medicine.price} د.ك'),
      trailing: Column(
        children: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.green),
            onPressed: () => controller.addProduct(item.medicine),
          ),
          Text('${item.quantity}'),
          IconButton(
            icon: const Icon(Icons.remove, color: Colors.red),
            onPressed: () => controller.removeProduct(item.medicine),
          ),
        ],
      ),
    );
  }

  Widget _summary(Color green) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          _row('المجموع', controller.subtotal),
          _row('التوصيل', controller.deliveryFee),
          const Divider(),
          _row('الإجمالي', controller.total, bold: true),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: green),
            onPressed: () {},
            child: const Text('متابعة الشراء'),
          ),
        ],
      ),
    );
  }

  Widget _row(String label, double value, {bool bold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('$value د.ك',
            style: TextStyle(fontWeight: bold ? FontWeight.bold : null)),
        Text(label),
      ],
    );
  }
}
