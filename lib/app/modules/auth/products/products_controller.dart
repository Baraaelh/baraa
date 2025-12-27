import 'package:get/get.dart';

class ProductsController extends GetxController {
  final products = [].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() {
    // TODO: API
    products.assignAll([1, 2, 3, 4, 5]);
  }
}
