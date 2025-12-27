import 'dart:io'; // ضروري للتعامل مع صور الملفات
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/modules/auth/Cart/Cart_Controller.dart';
import 'package:project/app/modules/auth/PharmacyDetails/Pharmacy_Details_Controller.dart';
  
 class PharmacyDetailsView extends GetView<PharmacyDetailsController> {
  const PharmacyDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PharmacyDetailsController());
    
    // لون أخضر متناسق مع هوية التطبيق
    const Color primaryGreen = Color(0xFF58A67E);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: AppBar(
        title: Text(controller.pharmacy.namePharmacy), // استخدام الاسم التجاري
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          _buildPharmacyHeader(primaryGreen),
          _medicineTitle(),
          Expanded(child: _medicineList(primaryGreen)),
        ],
      ),
    );
  }

  // الهيدر الذي يعرض بيانات الصيدلية
  Widget _buildPharmacyHeader(Color color) {
    final pharmacy = controller.pharmacy;
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))
        ],
      ),
      child: Row(
        children: [
          // عرض الصورة بشكل آمن (Asset أو File)
          CircleAvatar(
            radius: 35,
            backgroundColor: color.withOpacity(0.1),
            backgroundImage: _getImageProvider(pharmacy.image),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pharmacy.namePharmacy,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.location_on, size: 14, color: color),
                    const SizedBox(width: 4),
                    Text(pharmacy.address, style: TextStyle(color: Colors.grey[600], fontSize: 14)),
                  ],
                ),
                const SizedBox(height: 4),
                Text("هاتف: ${pharmacy.phone}", style: const TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _medicineTitle() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          'الأدوية المتوفرة',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
        ),
      ),
    );
  }

  Widget _medicineList(Color color) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(child: CircularProgressIndicator(color: color));
      }

      if (controller.medicinesList.isEmpty) {
        return const Center(child: Text("لا توجد أدوية مضافة حالياً"));
      }

      return GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        itemCount: controller.medicinesList.length,
        itemBuilder: (context, index) {
          final med = controller.medicinesList[index];

    // داخل GridView.builder في PharmacyDetailsView.dart

return Container(
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(15),
    border: Border.all(color: Colors.grey.withOpacity(0.1)),
  ),
  child: Column(
    children: [
      Expanded(child: _buildMedicineImage(med.image)),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(med.name, style: const TextStyle(fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${med.price} ₪', style: TextStyle(color: color, fontWeight: FontWeight.bold)),
                // عرض الكمية المتبقية
                Text('متوفر: ${med.quantity}', style: const TextStyle(fontSize: 10, color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 8),
            // زر الإضافة
            SizedBox(
              width: double.infinity,
              height: 30,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: color,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () => controller.addToCart(med), // استدعاء دالة الإضافة
                child: const Text("إضافة +", style: TextStyle(color: Colors.white, fontSize: 12)),
              ),
            ),
          ],
        ),
      ),
    ],
  ),
);
        },
      );
    });
  }

  // دالة ذكية لاختيار نوع الـ ImageProvider
  ImageProvider _getImageProvider(String? imagePath) {
    if (imagePath == null || imagePath.isEmpty) {
      return const AssetImage('assets/images/placeholder.png');
    }
    if (imagePath.contains('assets/')) {
      return AssetImage(imagePath);
    }
    return FileImage(File(imagePath));
  }

  // دالة بناء صورة الدواء
  Widget _buildMedicineImage(String imagePath) {
    if (imagePath.contains('assets/')) {
      return Image.asset(imagePath, fit: BoxFit.contain);
    }
    return Image.file(File(imagePath), fit: BoxFit.cover);
  }
}