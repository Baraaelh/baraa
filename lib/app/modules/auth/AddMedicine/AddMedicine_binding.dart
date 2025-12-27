import 'package:get/get.dart';
import 'package:project/app/modules/auth/AddMedicine/AddMedicine_Controller.dart';
 
class AddMedicationListBinding extends Bindings {
  @override
  void dependencies() {
    // استخدام lazyPut لإنشاء الكنترولر فقط عند الحاجة إليه
    Get.lazyPut<AddMedicationListController>(
      () => AddMedicationListController(),
    );
  }
}