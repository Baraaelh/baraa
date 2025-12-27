import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/modules/auth/Inventory/Inventory_Controller.dart';
import 'package:project/app/modules/auth/Widget2/common_bottom_nav1.dart'; // استيراد الـ Scaffold الموحد

class InventoryView extends GetView<InventoryController> {
  const InventoryView({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF58A67E);

    // استخدام PharmacistScaffold لربط الصفحة بشريط التنقل السفلي
    return PharmacistScaffold(
      index: 1, // إعطاء هذه الصفحة الاندكس 1 (Stock)
      body: Column(
        children: [
          // عنوان الصفحة بتصميم متناسق مع الهيدر الأبيض في الهوم
          _buildSimpleHeader(),
          
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator(color: primaryColor));
              }

              if (controller.myInventory.isEmpty) {
                return const Center(
                  child: Text("المخزن فارغ حالياً", style: TextStyle(color: Colors.grey)),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.all(16),
                physics: const BouncingScrollPhysics(),
                itemCount: controller.myInventory.length,
                itemBuilder: (context, index) {
                  final med = controller.myInventory[index];
                  return _buildMedicineCard(med, primaryColor);
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  // هيدر بسيط يشبه تصميم التطبيق العام
  Widget _buildSimpleHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20),
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
      child: const Center(
        child: Text(
          "مخزن الأدوية (Stock)",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }

  Widget _buildMedicineCard(med, Color primaryColor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            // 1. الصورة (مع معالج الأخطاء)
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                width: 60,
                height: 60,
                child: Image.asset(
                  med.image,
                  fit: BoxFit.cover,
                  // هذا الكود يمنع ظهور المربع الأحمر إذا كانت الصورة مفقودة
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[200],
                      child: const Icon(Icons.medication, color: Colors.grey),
                    );
                  },
                ),
              ),
            ),
            
            const SizedBox(width: 12), // مسافة بين الصورة والنص

            // 2. النصوص (الحل السحري: Expanded)
            // Expanded يجبر النص على أخذ كل المساحة المتاحة ويمنع الكتابة العمودية
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    med.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "الكمية: ${med.quantity}",
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  ),
                  Text(
                    "${med.price} د.ك",
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // 3. زر التعديل
            InkWell(
              onTap: () => _showEditPriceDialog(med),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "تعديل",
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _showEditPriceDialog(med) {
    final TextEditingController priceEditController = TextEditingController(text: med.price.toString());
    
    Get.defaultDialog(
      title: "تعديل السعر",
      titleStyle: const TextStyle(fontWeight: FontWeight.bold),
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Text(med.name, style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 15),
            TextField(
              controller: priceEditController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: "السعر الجديد",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                suffixText: "د.ك",
              ),
            ),
          ],
        ),
      ),
      textConfirm: "تحديث",
      textCancel: "إلغاء",
      confirmTextColor: Colors.white,
      buttonColor: const Color(0xFF58A67E),
      onConfirm: () {
        double? newPrice = double.tryParse(priceEditController.text);
        if (newPrice != null) {
          controller.updateMedicinePrice(med.id, newPrice);
          Get.back();
        } else {
          Get.snackbar("خطأ", "يرجى إدخال رقم صحيح");
        }
      },
    );
  }
}