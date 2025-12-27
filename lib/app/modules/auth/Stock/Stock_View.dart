// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'stock_controller.dart';

// class StockView extends GetView<StockController> {
//   const StockView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: const Text("Current Stock", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
//         centerTitle: true,
//       ),
//       body: Obx(() {
//         if (controller.myStock.isEmpty) {
//           return const Center(child: Text("المخزن فارغ، ابدأ بإضافة الأدوية"));
//         }
//         return ListView.builder(
//           padding: const EdgeInsets.all(20),
//           itemCount: controller.myStock.length,
//           itemBuilder: (context, index) {
//             final item = controller.myStock[index];
//             return _buildStockItem(item);
//           },
//         );
//       }),
//     );
//   }

//   Widget _buildStockItem(item) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 15),
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: const Color(0xFFE9F5EE), // اللون الأخضر الفاتح الموحد
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Row(
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(15),
//             child: Image.asset(item.image, width: 70, height: 70, fit: BoxFit.cover),
//           ),
//           const SizedBox(width: 15),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
//                 Text("Quantity: ${item.quantity}", style: const TextStyle(color: Colors.grey, fontSize: 13)),
//                 Text("${item.price}\$", style: const TextStyle(color: Color(0xFF59A985), fontWeight: FontWeight.bold)),
//               ],
//             ),
//           ),
//           IconButton(
//             icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
//             onPressed: () => controller.deleteFromStock(item.id),
//           ),
//         ],
//       ),
//     );
//   }
// }