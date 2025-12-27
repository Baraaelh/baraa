// import 'package:get/get.dart';
//  import 'package:project/app/modules/auth/AddMedicine/Medicine_Model.dart';
 
// class StockController extends GetxController {
//   // قائمة الأدوية الموجودة في المخزن (Rx لضمان تحديث الواجهة تلقائياً)
//   var myStock = <MedicineModel>[].obs;
//     var myInventory = <MedicineModel>[].obs;


//   @override
//   void onInit() {
//     super.onInit();
//     // يمكنك هنا استدعاء البيانات من السيرفر أو إضافة بيانات تجريبية
//     loadInitialStock();
//   }

//   void loadInitialStock() {
//     // بيانات تجريبية للعرض فقط
//     myStock.addAll([
//       MedicineModel(
//         id: '1',
//         name: 'Akmol',
//         price: 6.0,
//         quantity: 15, // الكمية المتوفرة في صيدليتي
//         image: 'assets/images/med1.png',
//         description: 'Pain relief, fast acting',
//       ),
//       MedicineModel(
//         id: '2',
//         name: 'Paracetamol',
//         price: 10.0,
//         quantity: 20,
//         image: 'assets/images/med2.png',
//         description: 'Pain reliever and fever reducer',
//       ),
//     ]);
//   }

//   // دالة لحذف دواء من المخزن
//   void deleteFromStock(String id) {
//     myStock.removeWhere((item) => item.id == id);
//     Get.snackbar("تنبيه", "تم حذف الدواء من المخزن", snackPosition: SnackPosition.BOTTOM);
//   }
// }




// import 'package:get/get.dart';
// import 'medicine_model.dart'; 

// class StockController extends GetxController {
//   // قائمة الأدوية الفعلية الموجودة في صيدليتي
//   var myInventory = <MedicineModel>[].obs;

//   // دالة لإضافة دواء جديد للمخزن أو تحديث كميته إذا كان موجوداً أصلاً
//   void addMedicationToStock(MedicineModel newMed) {
//     // التأكد إذا كان الدواء موجوداً مسبقاً في المخزن
//     int index = myInventory.indexWhere((item) => item.id == newMed.id);

//     if (index != -1) {
//       // إذا موجود، نحدث الكمية فقط (زيادة)
//       var existingMed = myInventory[index];
//       myInventory[index] = MedicineModel(
//         id: existingMed.id,
//         name: existingMed.name,
//         price: existingMed.price,
//         image: existingMed.image,
//         description: existingMed.description,
//         quantity: existingMed.quantity + newMed.quantity, // نجمع الكمية الجديدة مع القديمة
//       );
//     } else {
//       // إذا مش موجود، نضيفه كعنصر جديد
//       myInventory.add(newMed);
//     }
//   }
// }