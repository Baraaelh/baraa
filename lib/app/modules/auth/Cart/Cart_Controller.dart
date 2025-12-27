// import 'package:get/get.dart';
// import 'package:project/app/modules/auth/pharmacy_register/PharmacyRegisterModel.dart';
// import 'package:project/app/modules/auth/PharmacyDetails/Pharmacy_Details_Controller.dart';
 
// class CartController extends GetxController {
//   // قائمة الأدوية المختارة في السلة
//   var cartItems = <MedicineModel>[].obs;

//   // الحسابات الممالية
//   double get subtotal => cartItems.fold(0, (sum, item) => sum + item.price);
//   double deliveryFee = 2.650;
//   double get total => subtotal + deliveryFee;

//   // إضافة منتج للسلة وخصم واحد من الكمية الأصلية
//   void addProduct(MedicineModel product) {
//     if (product.quantity > 0) {
//       product.quantity--; 
//       cartItems.add(product);
//       cartItems.refresh();
//     }
//   }

//   // حذف منتج من السلة وإعادة الكمية للأصل
//   void removeProduct(MedicineModel product) {
//     product.quantity++;
//     cartItems.remove(product);
//     cartItems.refresh();
    
//     // تحديث واجهة صفحة الصيدلية إذا كانت مفتوحة
//     if (Get.isRegistered<PharmacyDetailsController>()) {
//       Get.find<PharmacyDetailsController>().medicinesList.refresh();
//     }
//   }
// }



// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_instance/src/extension_instance.dart';
// import 'package:get/get_navigation/src/extension_navigation.dart';
// import 'package:get/get_rx/src/rx_types/rx_types.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:project/app/modules/auth/AddMedicine/Medicine_Model.dart';
// import 'package:project/app/modules/auth/PharmacyDetails/Pharmacy_Details_Controller.dart';

// class CartController extends GetxController {
//   // جعل الكنترولر متاحاً بشكل ثابت لضمان عدم تكرار النسخ
//   static CartController get instance => Get.find();

//   var cartItems = <MedicineModel>[].obs;
//   // void addProduct(MedicineModel product) {
//   //   // التحقق من وجود المنتج مسبقاً لزيادة الكمية فقط (اختياري)
//   //   cartItems.add(product);
//   //   print("تمت إضافة المنتج: ${product.name}"); // للتأكد في الكونسول
//   //   cartItems.refresh(); // إجبار الواجهة على التحديث
//   // }

//   double get subtotal => cartItems.fold(0, (sum, item) => sum + item.price);
//   double deliveryFee = 2.650;
//   double get total => subtotal + deliveryFee;

//   void addProduct(MedicineModel product) {
//     if (product.quantity > 0) {
//       product.quantity--; 
//       cartItems.add(product);
//        cartItems.refresh();
//   //     // تحديث قائمة الصيدلية لكي يظهر نقص العدد فوراً
//       if (Get.isRegistered<PharmacyDetailsController>()) {
//         Get.find<PharmacyDetailsController>().medicinesList.refresh();
//       }
//     } else {
//       Get.snackbar("تنبيه", "هذا الدواء غير متوفر حالياً");
//     }
//   }

//   void removeProduct(MedicineModel product) {
//     product.quantity++;
//     cartItems.remove(product);
//     if (Get.isRegistered<PharmacyDetailsController>()) {
//       Get.find<PharmacyDetailsController>().medicinesList.refresh();
//     }
//   }
// }






// lib/app/modules/cart/cart_controller.dart
// lib/app/modules/cart/cart_controller.dart

import 'package:get/get.dart';
import 'package:project/app/modules/auth/AddMedicine/Medicine_Model.dart';
import 'package:project/app/modules/auth/Cart/CartItemModel.dart';
 

class CartController extends GetxController {
  static CartController get to => Get.find();

  var cartItems = <CartItemModel>[].obs;

  final double deliveryFee = 2.650;

  // ================= ADD =================
  void addProduct(MedicineModel medicine) {
    final index = cartItems.indexWhere(
      (item) => item.medicine.id == medicine.id,
    );

    if (index >= 0) {
      cartItems[index].quantity++;
      cartItems.refresh();
    } else {
      cartItems.add(CartItemModel(medicine: medicine));
    }
  }

  // ================= REMOVE =================
  void removeProduct(MedicineModel medicine) {
    final index = cartItems.indexWhere(
      (item) => item.medicine.id == medicine.id,
    );

    if (index >= 0) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity--;
        cartItems.refresh();
      } else {
        cartItems.removeAt(index);
      }
    }
  }

  // ================= CALCULATIONS =================
  double get subtotal => cartItems.fold(
        0,
        (sum, item) => sum + item.totalPrice,
      );

  double get total => subtotal + deliveryFee;

  void clearCart() {
    cartItems.clear();
  }
}
