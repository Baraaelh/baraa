// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:project/app/modules/auth/AddMedicine/Medicine_Model.dart';
// import 'package:project/app/modules/auth/Inventory/Inventory_Controller.dart'; // تأكد من صحة المسار
 

// class AddMedicationListController extends GetxController {
  
//   // 1. قائمة الكتالوج (الأدوية المتاحة للاختيار منها)
//   final List<MedicineModel> catalogMedicines = [
//     MedicineModel(
//       id: '1',
//       name: 'Akmol',
//       price: 6.0,
//       quantity: 100,
//       image: 'assets/images/med1.png',
//       description: 'Pain relief, fast acting',
//     ),
//     MedicineModel(
//       id: '2',
//       name: 'Paracetamol',
//       price: 10.0,
//       quantity: 50,
//       image: 'assets/images/med2.png',
//       description: 'Pain reliever and fever reducer',
//     ),
//     MedicineModel(
//       id: '3',
//       name: 'Injection',
//       price: 35.0,
//       quantity: 50,
//       image: 'assets/images/med3.png',
//       description: 'Direct medication into bloodstream',
//     ),
//     MedicineModel(
//       id: '4',
//       name: 'Reluctantly',
//       price: 10.0,
//       quantity: 60,
//       image: 'assets/images/med4.png',
//       description: 'Hesitantly or unwillingly done',
//     ),
//     MedicineModel(
//       id: '5',
//       name: 'Cream',
//       price: 9.0,
//       quantity: 200,
//       image: 'assets/images/med5.png',
//       description: 'Soothing topical skin treatment',
//     ),
//   ];

//   // 2. خريطة لتخزين الكمية المختارة لكل دواء في الواجهة
//   var selectedQuantities = <String, RxInt>{}.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     // تهيئة العداد لكل دواء بـ 1
//     for (var med in catalogMedicines) {
//       selectedQuantities[med.id] = 1.obs;
//     }
//   }

//   // زيادة العداد
//   void incrementQuantity(String id) {
//     if (selectedQuantities.containsKey(id)) {
//       selectedQuantities[id]!.value++;
//     }
//   }

//   // إنقاص العداد
//   void decrementQuantity(String id) {
//     if (selectedQuantities.containsKey(id) && selectedQuantities[id]!.value > 1) {
//       selectedQuantities[id]!.value--;
//     }
//   }

//   // ✅ الدالة المنطقية للإضافة إلى المخزن (Inventory)
//   void addMedicineToMyStock(MedicineModel med) {
//     int quantityToAdd = selectedQuantities[med.id]!.value;

//     try {
//       // الوصول لـ InventoryController الموجود في الذاكرة
//       final inventoryController = Get.find<InventoryController>();

//       // البحث: هل الدواء موجود مسبقاً في المخزن؟
//       int existingIndex = inventoryController.myInventory.indexWhere((item) => item.id == med.id);

//       if (existingIndex != -1) {
//         // إذا موجود: نزيد الكمية فقط
//         inventoryController.myInventory[existingIndex].quantity += quantityToAdd;
//         inventoryController.myInventory.refresh(); // مهم جداً لتحديث الواجهة
//       } else {
//         // إذا غير موجود: ننشئ نسخة جديدة ونضيفها
//         MedicineModel newStockItem = MedicineModel(
//           id: med.id,
//           name: med.name,
//           price: med.price, // السعر الافتراضي من الكتالوج
//           quantity: quantityToAdd,
//           image: med.image,
//           description: med.description,
//         );
//         inventoryController.myInventory.add(newStockItem);
//       }

//       // تصفير العداد في واجهة الإضافة بعد النجاح
//       selectedQuantities[med.id]!.value = 1;

//       // تنبيه المستخدم بالنجاح
//       _showSuccessSnackbar(med.name, quantityToAdd);
      
//     } catch (e) {
//       // في حال لم يكن InventoryController قد تم إنشاؤه بعد
//       Get.snackbar("خطأ", "لم يتم تحميل المخزن بشكل صحيح", backgroundColor: Colors.red.withOpacity(0.7), colorText: Colors.white);
//     }
//   }

//   void _showSuccessSnackbar(String name, int quantity) {
//   Get.snackbar(
//     "تمت الإضافة بنجاح ✅",
//     "تم إضافة $quantity عبوة من $name إلى مخزنك",
//     backgroundColor: const Color(0xFF59A985),
//     colorText: Colors.white,
//     snackPosition: SnackPosition.BOTTOM,
//     duration: const Duration(seconds: 3),
//     margin: const EdgeInsets.all(15),
//     borderRadius: 15,
//     // إضافة زر انتقال للمخزن داخل التنبيه
//     mainButton: TextButton(
//       onPressed: () {
//         if (Get.isSnackbarOpen) Get.back(); // إغلاق السناك بار أولاً
//         Get.toNamed('/Inventory_View'); // تأكد من اسم الـ Route لمخزنك
//       },
//       child: const Text(
//         "عرض المخزن",
//         style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
//       ),
//     ),
//   );
// }
// }



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/modules/auth/AddMedicine/Medicine_Model.dart';
 import 'package:project/app/modules/auth/Inventory/Inventory_Controller.dart';
import 'package:project/app/modules/auth/PharmacistHome/Pharmacist_Home_Controller.dart';

class AddMedicationListController extends GetxController {
  // 1. قائمة الكتالوج (الأدوية المتاحة للاختيار منها)
  final List<MedicineModel> catalogMedicines = [
    MedicineModel(
      id: '1',
      name: 'Akmol',
      price: 6.0,
      quantity: 100, // الكمية المتوفرة في الكتالوج العام
      image: 'assets/images/med1.png',
      description: 'Pain relief, fast acting',
    ),
    MedicineModel(
      id: '2',
      name: 'Paracetamol',
      price: 10.0,
      quantity: 50,
      image: 'assets/images/med2.png',
      description: 'Pain reliever and fever reducer',
    ),
    MedicineModel(
      id: '3',
      name: 'Injection',
      price: 35.0,
      quantity: 50,
      image: 'assets/images/med3.png',
      description: 'Direct medication into bloodstream',
    ),
    MedicineModel(
      id: '4',
      name: 'Reluctantly',
      price: 10.0,
      quantity: 60,
      image: 'assets/images/med4.png',
      description: 'Hesitantly or unwillingly done',
    ),
    MedicineModel(
      id: '5',
      name: 'Cream',
      price: 9.0,
      quantity: 200,
      image: 'assets/images/med5.png',
      description: 'Soothing topical skin treatment',
    ),
  ];

  // 2. خريطة لتخزين الكمية المختارة لكل دواء في الواجهة
  var selectedQuantities = <String, RxInt>{}.obs;

  @override
  void onInit() {
    super.onInit();
    // تهيئة العداد لكل دواء بـ 1
    for (var med in catalogMedicines) {
      selectedQuantities[med.id] = 1.obs;
    }
  }

  void incrementQuantity(String id) {
    if (selectedQuantities.containsKey(id)) {
      selectedQuantities[id]!.value++;
    }
  }

  void decrementQuantity(String id) {
    if (selectedQuantities.containsKey(id) && selectedQuantities[id]!.value > 1) {
      selectedQuantities[id]!.value--;
    }
  }

  // ✅ الدالة المنطقية للإضافة إلى المخزن (Inventory) بناءً على الصيدلية الحالية
  // void addMedicineToMyStock(MedicineModel med) {
  //   int quantityToAdd = selectedQuantities[med.id]!.value;

  //   try {
  //     // أ. الوصول لكنترولر الهوم لمعرفة بيانات الصيدلية الحالية (مثل صيدلية الشفاء)
  //     final homeController = Get.find<PharmacistHomeController>();
  //     String pharmacyName = homeController.currentPharmacy.value?.namePharmacy ?? "الصيدلية";

  //     // ب. الوصول لـ InventoryController الموجود في الذاكرة
  //   //  final inventoryController = Get.find<InventoryController>();

  //   final inventoryController = Get.isRegistered<InventoryController>() 
  //   ? Get.find<InventoryController>() 
  //   : Get.put(InventoryController());

  //     // ج. البحث: هل الدواء موجود مسبقاً في مخزنك؟
  //     int existingIndex = inventoryController.myInventory.indexWhere((item) => item.id == med.id);

  //     if (existingIndex != -1) {
  //       // إذا موجود: نزيد الكمية القديمة بالعدد المختار من العداد
  //       inventoryController.myInventory[existingIndex].quantity += quantityToAdd;
  //       inventoryController.myInventory.refresh();
  //     } else {
  //       // إذا غير موجود: ننشئ نسخة جديدة ونضع فيها الكمية المختارة
  //       MedicineModel newStockItem = MedicineModel(
  //         id: med.id,
  //         name: med.name,
  //         price: med.price, 
  //         quantity: quantityToAdd, // الكمية التي حددها المستخدم بالـ +
  //         image: med.image,
  //         description: med.description,
  //       );
  //       inventoryController.myInventory.add(newStockItem);
  //     }

  //     // تصفير العداد للرقم 1 بعد الإضافة
  //     selectedQuantities[med.id]!.value = 1;

  //     // تنبيه المستخدم بالنجاح مع ذكر اسم الصيدلية
  //     _showSuccessSnackbar(med.name, quantityToAdd, pharmacyName);
      
  //   } catch (e) {
  //     Get.snackbar("خطأ", "تأكد من تشغيل المخزن أولاً", 
  //       backgroundColor: Colors.red.withOpacity(0.7), colorText: Colors.white);
  //   }
  // }




void addMedicineToMyStock(MedicineModel med) {
  int quantityToAdd = selectedQuantities[med.id]!.value;

  try {
    // جلب نسخة المخزن الدائمة
    final inventoryController = Get.put(InventoryController(), permanent: true);
    final homeController = Get.find<PharmacistHomeController>();
    String pharmacyName = homeController.currentPharmacy.value?.namePharmacy ?? "الصيدلية";

    // فحص التكرار
    int existingIndex = inventoryController.myInventory.indexWhere((item) => item.id == med.id);

    if (existingIndex != -1) {
      inventoryController.myInventory[existingIndex].quantity += quantityToAdd;
      // تحديث يدوي للتأكد من استجابة الواجهة
      inventoryController.myInventory.refresh();
    } else {
      // عمل نسخة جديدة تماماً لضمان عدم الارتباط بالكتالوج
      MedicineModel newStockItem = MedicineModel(
        id: med.id,
        name: med.name,
        price: med.price,
        quantity: quantityToAdd,
        image: med.image,
        description: med.description,
      );
      inventoryController.myInventory.add(newStockItem);
    }

    // تأكيد في الـ Console (اختياري للتأكد)
    debugPrint("المخزن الآن يحتوي على: ${inventoryController.myInventory.length} أصناف");

    selectedQuantities[med.id]!.value = 1;
    _showSuccessSnackbar(med.name, quantityToAdd, pharmacyName);
    
  } catch (e) {
    debugPrint("Error adding to stock: $e");
  }
}




  void _showSuccessSnackbar(String name, int quantity, String pharmacy) {
    Get.snackbar(
      "تمت الإضافة لـ $pharmacy ✅",
      "تم إضافة $quantity عبوة من $name بنجاح",
      backgroundColor: const Color(0xFF59A985),
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(15),
      borderRadius: 15,
      mainButton: TextButton(
        onPressed: () {
          if (Get.isSnackbarOpen) Get.back();
          Get.toNamed('/Inventory_View'); // تأكد من مطابقة هذا الاسم لـ AppPages
        },
        child: const Text(
          "المخزن",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}