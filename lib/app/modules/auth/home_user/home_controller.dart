//lib/app/modules/home/home_controller.dart

import 'package:get/get.dart';
import 'package:project/routes/app_routes.dart';

class HomeController extends GetxController {
  final selectedIndex = 0.obs;

  void onItemTapped(int index) {
    selectedIndex.value = index;

    switch (index) {
      case 1:
        Get.offNamed('/pharmacies_view');
        Get.offNamed(AppRoutes.pharmacies_choice);
        break;
      case 2:
        Get.offNamed('/chat');
        break;
      case 3:
       // Get.offNamed('/settings_view');
        Get.offNamed(AppRoutes.setting_profile);

        break;
    }
  }

  void navigateToDelivery() {
    Get.toNamed('/select_location_view');
  }
}


// import 'package:get/get.dart';
// import 'package:project/app/data/models/product_model.dart';
// import 'package:project/app/data/providers/api_provider.dart';
// import 'package:project/app/data/repositories/product_repository.dart';


// class HomeController extends GetxController {
//   final ProductRepository repository =
//       ProductRepository(ApiProvider());

//   RxBool isLoading = false.obs;
//   RxList<ProductModel> products = <ProductModel>[].obs;

//   @override
//   void onInit() {
//     super.onInit();
//     fetchProducts();
//   }

//   Future<void> fetchProducts() async {
//     try {
//       isLoading.value = true;
//       products.value = await repository.fetchProducts();
//     } catch (_) {
//       Get.snackbar('خطأ', 'فشل تحميل المنتجات');
//     } finally {
//       isLoading.value = false;
//     }
//   }
//    void navigateToDelivery() {
//     Get.toNamed('/delivery-address');
//   }
// }
