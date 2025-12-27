import 'package:get/get.dart';
import 'package:project/app/modules/auth/Inventory/Inventory_Controller.dart';
  
class StockBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InventoryController>(() => InventoryController());
  }
}
