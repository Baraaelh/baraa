import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/modules/auth/select_location/select_location_controller.dart';

class AddressView extends GetView<AddressController> {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryGreen = Color(0xFFA8D1BD); // نفس درجة لون الزر في صورتك

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios, color: Colors.grey), onPressed: () => Get.back()),
        title: const Text("عنوان جديد", style: TextStyle(color: primaryGreen, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // 1. قسم الخريطة (الصورة)
              GestureDetector(
                onTap: () => controller.openGoogleMaps(),
                child: Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/map_placeholder.png'), // صورتك المرفقة
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                      decoration: BoxDecoration(color: Colors.white.withOpacity(0.8), borderRadius: BorderRadius.circular(10)),
                      child: const Text("حدد العنوان على الخريطة", style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // 2. حقول الإدخال اليدوي
              _buildTextField("المنطقة", controller.areaController),
              _buildTextField("الشارع", controller.streetController),
              _buildTextField("رقم المنزل", controller.houseNumController),
              
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(child: _buildTextField("الدور", controller.floorController)),
                  const SizedBox(width: 15),
                  Expanded(child: _buildTextField("الشقة", controller.apartmentController)),
                ],
              ),

              const SizedBox(height: 40),

              // 3. زر الحفظ
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryGreen,
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                  onPressed: () => controller.saveAddress(),
                  child: const Text("حفظ العنوان", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController ctr) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        controller: ctr,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          labelText: label,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: const BorderSide(color: Colors.grey)),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide(color: Colors.grey.shade300)),
        ),
      ),
    );
  }
}