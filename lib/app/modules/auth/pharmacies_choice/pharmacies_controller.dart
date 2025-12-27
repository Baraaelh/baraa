// // // // import 'package:get/get.dart';
// // // // import 'package:project/app/modules/auth/pharmacies_choice/PharmacyModel.dart';

// // // // class PharmacyListController extends GetxController {
// // // //   var isLoading = false.obs;
// // // //   var pharmacies = <PharmacyModel>[].obs;

// // // //   @override
// // // //   void onInit() {
// // // //     super.onInit();
// // // //     fetchPharmacies();
// // // //   }

// // // //   void fetchPharmacies() async {
// // // //     isLoading.value = true;

// // // //     // 🔹 مؤقتاً بيانات وهمية
// // // //     pharmacies.value = [
// // // //       PharmacyModel(
// // // //         id: 1,
// // // //         name: 'صيدلية الشفاء',
// // // //         address: 'غزة',
// // // //         image: 'assets/images/pharmacy1.png', medicines: [],
// // // //       ),
// // // //       PharmacyModel(
// // // //         id: 2,
// // // //         name: 'صيدلية الرحمة',
// // // //         address: 'رفح',
// // // //         image: 'assets/images/pharmacy2.png', medicines: [],
// // // //       ),
// // // //     ];

// // // //     isLoading.value = false;
// // // //   }

// // // //   /// 🔥 هذا أهم سطر
// // // //   void selectPharmacy(PharmacyModel pharmacy) {
// // // //     Get.toNamed(
// // // //       '/pharmacy-details',
// // // //       arguments: pharmacy,
// // // //     );
// // // //   }
// // // //   // دالة البحث والفلترة (تبحث في اسم الصيدلية، العنوان، أو اسم الدواء)
// // // //   void runFilter(String query) {
// // // //     if (query.isEmpty) {
// // // //       filteredPharmacies.assignAll(allPharmacies);
// // // //     } else {
// // // //       var results = allPharmacies.where((pharmacy) {
// // // //         // البحث في اسم الصيدلية أو العنوان
// // // //         bool matchPharmacy = pharmacy.name.contains(query) || pharmacy.address.contains(query);
        
// // // //         // البحث في قائمة الأدوية داخل كل صيدلية
// // // //         bool matchMedicine = pharmacy.medicines.any((med) => med.name.contains(query));
        
// // // //         return matchPharmacy || matchMedicine;
// // // //       }).toList();
      
// // // //       filteredPharmacies.assignAll(results);
// // // //     }
// // // //   }

// // // //   // فلترة حسب الموقع (مثال بسيط)
// // // //   void filterByLocation(String city) {
// // // //     var results = allPharmacies.where((p) => p.address.contains(city)).toList();
// // // //     filteredPharmacies.assignAll(results);
// // // //   }

// // // //   void selectPharmacy(PharmacyModel pharmacy) {
// // // //     Get.toNamed('/pharmacy-details', arguments: pharmacy);
// // // //   }
  
// // // // }


// // // import 'package:get/get.dart';
// // // import 'package:project/app/data/repositories/medicine_repository.dart';
// // // // تأكد من استيراد الموديلات الصحيحة
// // // import 'package:project/app/modules/auth/pharmacies_choice/PharmacyModel.dart';

// // // class PharmacyListController extends GetxController {
// // //   var isLoading = false.obs;
  
// // //   // القائمة الأصلية
// // //   var allPharmacies = <PharmacyModel>[].obs;
// // //   // القائمة التي تعرض في الواجهة (المفلترة)
// // //   var filteredPharmacies = <PharmacyModel>[].obs;
// // //   late PharmacyModel pharmacyModel ;
 

// // //   @override
// // //   void onInit() {
// // //     super.onInit();
// // //     fetchPharmacies();
// // //   }

// // //   void fetchPharmacies() async {
// // //     isLoading.value = true;
// // //     await Future.delayed(const Duration(seconds: 1)); // محاكاة طلب API

// // //     var data = [
// // //       PharmacyModel(
// // //         id: 1,
// // //         name: 'صيدلية الشفاء',
// // //         address: 'غزة - الرمال',
// // //         image: 'assets/images/pharmacy1.png',
// // //         medicines: pharmacyModel.medicines
// // //       ),
// // //       PharmacyModel(
// // //         id: 2,
// // //         name: 'صيدلية القدس',
// // //         address: 'دوار الميناء',
// // //         image: 'assets/images/pharmacy2.png',
// // //         medicines: pharmacyModel.medicines,
// // //       ),
// // //     ];

// // //     // استخدام assignAll يحل مشكلة TypeError التي ظهرت في الشاشة الحمراء
// // //     allPharmacies.assignAll(data);
// // //     filteredPharmacies.assignAll(data);
    
// // //     isLoading.value = false;
// // //   }

// // //   // دالة البحث والفلترة (تبحث في اسم الصيدلية، العنوان، أو اسم الدواء)
// // //   void runFilter(String query) {
// // //     if (query.isEmpty) {
// // //       filteredPharmacies.assignAll(allPharmacies);
// // //     } else {
// // //       var results = allPharmacies.where((pharmacy) {
// // //         // البحث في اسم الصيدلية أو العنوان
// // //         bool matchPharmacy = pharmacy.name.contains(query) || pharmacy.address.contains(query);
        
// // //         // البحث في قائمة الأدوية داخل كل صيدلية
// // //         bool matchMedicine = pharmacy.medicines.any((med) => med.name.contains(query));
        
// // //         return matchPharmacy || matchMedicine;
// // //       }).toList();
      
// // //       filteredPharmacies.assignAll(results);
// // //     }
// // //   }

// // //   // فلترة حسب الموقع (مثال بسيط)
// // //   void filterByLocation(String city) {
// // //     var results = allPharmacies.where((p) => p.address.contains(city)).toList();
// // //     filteredPharmacies.assignAll(results);
// // //   }

// // //   void selectPharmacy(PharmacyModel pharmacy) {
// // //     Get.toNamed('/pharmacy-details', arguments: pharmacy);
// // //   }
// // // }



// // import 'package:flutter/material.dart';
// // import 'package:get/get_core/src/get_main.dart';
// // import 'package:get/get_rx/src/rx_types/rx_types.dart';
// // import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// // import 'package:project/app/data/repositories/medicine_repository.dart';
// // import 'package:project/app/modules/auth/pharmacies_choice/PharmacyModel.dart';

// // class PharmacyListController extends GetxController {
// //   var isLoading = false.obs;
// //   var pharmacies = <PharmacyModel>[].obs; // القائمة الأصلية
// //   var filteredPharmacies = <PharmacyModel>[].obs; // القائمة المعروضة بعد الفلترة
  
// //   // لربط حقل النص في الواجهة بالكنترولر
// //   final searchController = TextEditingController();

// //   @override
// //   void onInit() {
// //     super.onInit();
// //     fetchPharmacies();
// //   }

// //   void fetchPharmacies() async {
// //     isLoading.value = true;
// //     await Future.delayed(const Duration(seconds: 1));

// //     var data = [
// //       PharmacyModel(
// //         id: 1,
// //         name: 'صيدلية الشفاء',
// //         address: 'غزة - الرمال',
// //         image: 'assets/images/pharmacy1.png',
// //         medicines: [
// //           MedicineModel(id: 101, name: 'بندول اكسترا', price: 16.5, image: 'assets/images/med1.png'),
// //           MedicineModel(id: 102, name: 'أسبيرين', price: 5.0, image: 'assets/images/med2.png'),
// //         ],
// //       ),
// //       PharmacyModel(
// //         id: 2,
// //         name: 'صيدلية القدس',
// //         address: 'دوار الميناء',
// //         image: 'assets/images/pharmacy2.png',
// //         medicines: [
// //           MedicineModel(id: 201, name: 'بروفين', price: 20.0, image: 'assets/images/med3.png'),
// //         ],
// //       ),
// //     ];

// //     pharmacies.assignAll(data);
// //     filteredPharmacies.assignAll(data);
// //     isLoading.value = false;
// //   }

// //   // دالة البحث المتقدمة
// //   void filterSearch(String query) {
// //     if (query.isEmpty) {
// //       filteredPharmacies.assignAll(pharmacies);
// //     } else {
// //       String lowercaseQuery = query.toLowerCase();

// //       var results = pharmacies.where((pharmacy) {
// //         // 1. هل النص موجود في اسم الصيدلية أو العنوان؟
// //         bool matchesPharmacy = pharmacy.name.toLowerCase().contains(lowercaseQuery) || 
// //                                pharmacy.address.toLowerCase().contains(lowercaseQuery);

// //         // 2. هل النص موجود في اسم أي دواء داخل هذه الصيدلية؟
// //         bool matchesMedicines = pharmacy.medicines.any((med) => 
// //                                med.name.toLowerCase().contains(lowercaseQuery));

// //         return matchesPharmacy || matchesMedicines;
// //       }).toList();

// //       filteredPharmacies.assignAll(results);
// //     }
// //   }

// //   // دالة للفلترة حسب المدينة (الموقع)
// //   void filterByLocation(String location) {
// //     if (location == "الكل") {
// //       filteredPharmacies.assignAll(pharmacies);
// //     } else {
// //       filteredPharmacies.assignAll(
// //         pharmacies.where((p) => p.address.contains(location)).toList()
// //       );
// //     }
// //   }

// //   void selectPharmacy(PharmacyModel pharmacy) {
// //     Get.toNamed('/pharmacy-details', arguments: pharmacy);
// //   }
// // }



// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import 'package:project/app/modules/auth/pharmacies_choice/PharmacyModel.dart';

// class PharmacyListController extends GetxController {
//   var isLoading = false.obs;
//   var allPharmacies = <PharmacyModel>[].obs; // القائمة الثابتة
//   var filteredPharmacies = <PharmacyModel>[].obs; // القائمة المتغيرة للبحث
  
//   final searchController = TextEditingController();

//   @override
//   void onInit() {
//     super.onInit();
//     fetchPharmacies();
//   }

//   void fetchPharmacies() async {
//     isLoading.value = true;
//     await Future.delayed(const Duration(seconds: 1)); 

//     var data = [
//       PharmacyModel(
//         id: 1, name: 'صيدلية الشفاء', address: 'غزة - الرمال', image: 'assets/images/pharmacy1.png',
//         medicines: [
//           MedicineModel(id: 101, name: 'بندول اكسترا', price: 15.0, image: 'assets/images/med1.png'),
//           MedicineModel(id: 102, name: 'أومول', price: 7.5, image: 'assets/images/med2.png'),
//         ]
//       ),
//       PharmacyModel(
//         id: 2, name: 'صيدلية الرحمة', address: 'رفح - وسط البلد', image: 'assets/images/pharmacy2.png',
//         medicines: [
//           MedicineModel(id: 201, name: 'بروفين', price: 20.0, image: 'assets/images/med3.png'),
//         ]
//       ),
//     ];

//     allPharmacies.assignAll(data);
//     filteredPharmacies.assignAll(data);
//     isLoading.value = false;
//   }

//   // دالة البحث المتقدمة (صيدلية أو دواء)
//   void filterSearch(String query) {
//     if (query.isEmpty) {
//       filteredPharmacies.assignAll(allPharmacies);
//     } else {
//       String q = query.toLowerCase();
//       var results = allPharmacies.where((pharmacy) {
//         // البحث في اسم الصيدلية أو العنوان
//         bool matchPharmacy = pharmacy.name.toLowerCase().contains(q) || pharmacy.address.toLowerCase().contains(q);
//         // البحث في قائمة الأدوية داخل كل صيدلية
//         bool matchMedicine = pharmacy.medicines.any((med) => med.name.toLowerCase().contains(q));
        
//         return matchPharmacy || matchMedicine;
//       }).toList();
      
//       filteredPharmacies.assignAll(results);
//     }
//   }

//   void selectPharmacy(PharmacyModel pharmacy) {
//     Get.toNamed('/pharmacy-details', arguments: pharmacy);
//   }
// }

// lib/app/modules/auth/pharmacies_choice/pharmacies_controller.dart

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'PharmacyModel.dart'; // استيراد واحد فقط يحل مشكلة الـ ambiguous_import

// class PharmacyListController extends GetxController {
//   var isLoading = false.obs;
//   var allPharmacies = <PharmacyModel>[].obs;
//   var filteredPharmacies = <PharmacyModel>[].obs;
//   final searchController = TextEditingController();

//   @override
//   void onInit() {
//     super.onInit();
//     fetchPharmacies();
//   }

//   void fetchPharmacies() async {
//     isLoading.value = true;
//     await Future.delayed(const Duration(seconds: 1));

//     var data = [
//       PharmacyModel(
//         id: 1, name: 'صيدلية الشفاء', address: 'غزة - الرمال', image: 'assets/images/pharmacy1.png',
//         medicines: [
//           MedicineModel(id: 101, name: 'بندول', image: 'assets/images/med1.png', price: 15.0),
//         ]
//       ),
//       PharmacyModel(
//         id: 2, name: 'صيدلية القدس', address: 'خانيونس', image: 'assets/images/pharmacy2.png',
//         medicines: [
//           MedicineModel(id: 201, name: 'أومول', image: 'assets/images/med2.png', price: 10.0),
//         ]
//       ),
//     ];

//     allPharmacies.assignAll(data);
//     filteredPharmacies.assignAll(data);
//     isLoading.value = false;
//   }

//   void filterSearch(String query) {
//     if (query.isEmpty) {
//       filteredPharmacies.assignAll(allPharmacies);
//     } else {
//       String q = query.toLowerCase();
//       filteredPharmacies.assignAll(allPharmacies.where((p) {
//         bool matchName = p.name.toLowerCase().contains(q);
//         bool matchMed = p.medicines.any((m) => m.name.toLowerCase().contains(q));
//         return matchName || matchMed;
//       }).toList());
//     }
//   }

 
//   void selectPharmacy(PharmacyModel pharmacy) {
//     Get.toNamed('/pharmacy-details', arguments: pharmacy);
//   }
// }

// lib/app/modules/auth/pharmacies_choice/pharmacies_controller.dart
// import 'package:get/get.dart';
// import 'package:project/app/modules/auth/pharmacies_choice/PharmacyDataService.dart';
// import 'PharmacyModel.dart';

// class PharmacyListController extends GetxController {
//   final _dataService = Get.find<PharmacyDataService>();
//   var filteredPharmacies = <PharmacyModel>[].obs;

//   @override
//   void onInit() {
//     super.onInit();
//     // مراقبة الدكشنري: أي تغيير فيه يغير القائمة فوراً
//     ever(_dataService.pharmaciesMap, (_) => _updateList());
//     _updateList();
//   }

//   void _updateList() {
//     filteredPharmacies.assignAll(_dataService.pharmaciesMap.values.toList());
//   }

//   void filterSearch(String query) {
//     if (query.isEmpty) {
//       _updateList();
//     } else {
//       String q = query.toLowerCase();
//       filteredPharmacies.assignAll(
//         _dataService.pharmaciesMap.values.where((p) => 
//           p.name.toLowerCase().contains(q) || 
//           p.medicines.any((m) => m.name.toLowerCase().contains(q))
//         ).toList()
//       );
//     }
//   }

//   void selectPharmacy(PharmacyModel pharmacy) {
//     Get.toNamed('/pharmacy-details', arguments: pharmacy);
//   }
// }

// lib/app/modules/auth/pharmacies_choice/pharmacy_list_controller.dart

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:project/app/modules/auth/pharmacies_choice/PharmacyDataService.dart';
// import 'PharmacyModel.dart';

// class PharmacyListController extends GetxController {
//   // الوصول لمخزن البيانات المركزي (الذي يحتوي على الدكشنري)
//   final _dataService = Get.find<PharmacyDataService>();

//   // الحالات (States)
//   var filteredPharmacies = <PharmacyModel>[].obs;
//   var isLoading = false.obs;
  
//   // التحكم في نصوص البحث
//   final searchController = TextEditingController();

//   @override
//   void onInit() {
//     super.onInit();
//     // 1. مراقبة الدكشنري: أي إضافة في صفحة التسجيل ستحدث هذه القائمة فوراً
//     ever(_dataService.pharmaciesMap, (_) => _syncListWithMap());
    
//     // 2. المزامنة الأولية عند فتح الصفحة
//     _syncListWithMap();
//   }

//   // مزامنة القائمة المفلترة مع الدكشنري الأساسي
//   void _syncListWithMap() {
//     filteredPharmacies.assignAll(_dataService.pharmaciesMap.values.toList());
//   }

//   // دالة البحث المتقدم (تبحث في اسم الصيدلية وفي أسماء الأدوية المتوفرة)
//   void filterSearch(String query) {
//     if (query.isEmpty) {
//       _syncListWithMap();
//     } else {
//       String q = query.toLowerCase();
//       filteredPharmacies.assignAll(
//         _dataService.pharmaciesMap.values.where((pharmacy) {
//           // التحقق من الاسم
//           bool matchName = pharmacy.name.toLowerCase().contains(q);
//           // التحقق من الأدوية داخل الصيدلية
//           bool matchMedicine = pharmacy.medicines.any(
//             (med) => med.name.toLowerCase().contains(q)
//           );
//           return matchName || matchMedicine;
//         }).toList()
//       );
//     }
//   }

//   // دالة لاختيار صيدلية والانتقال للتفاصيل
//   void selectPharmacy(PharmacyModel pharmacy) {
//     Get.toNamed('/pharmacy-details', arguments: pharmacy);
//   }

//   // --- دوال الموقع والخرائط (Maps) ---

//   // عرض الصيدليات القريبة على الخريطة (باستخدام العنوان أو الإحداثيات)
//   void showPharmaciesOnMap() {
//     // نجمع أسماء أو عناوين الصيدليات المفلترة حالياً
//     List<String> locations = filteredPharmacies
//         .map((p) => "${p.name}, ${p.address}")
//         .toList();

//     if (locations.isNotEmpty) {
//       // هذه الدالة وهمية هنا، استبدلها بـ Call لـ maps_local tool في الـ UI
//       debugPrint("Showing ${locations.length} pharmacies on map");
//     } else {
//       Get.snackbar("تنبيه", "لا توجد صيدليات لعرضها على الخريطة");
//     }
//   }

//   // جلب موقع المستخدم الحالي لتحديد الصيدليات الأقرب
//   Future<void> findNearestPharmacies() async {
//     try {
//       isLoading.value = true;
//       // هنا يتم الربط مع خدمة الموقع (Location Service)
//       // محاكاة تأخير
//       await Future.delayed(const Duration(seconds: 1));
      
//       // منطق الترتيب حسب المسافة سيتم هنا لاحقاً عند ربط الخرائط
//       Get.snackbar("الموقع", "يتم الآن عرض الصيدليات الأقرب إليك");
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   @override
//   void onClose() {
//     searchController.dispose();
//     super.onClose();
//   }
// }

// lib/app/modules/auth/pharmacies_choice/pharmacy_list_controller.dart

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:project/app/modules/auth/pharmacies_choice/PharmacyDataService.dart';
// import 'PharmacyModel.dart';

// class PharmacyListController extends GetxController {
//   // 1. الوصول للخدمة المركزية التي تم حقنها في الـ InitialBinding أو الـ Main
//   final PharmacyDataService _dataService = Get.find<PharmacyDataService>();

//   // 2. المتغيرات المراقبة (Observable)
//   var filteredPharmacies = <PharmacyModel>[].obs;
//   var isLoading = false.obs;
  
//   // التحكم في نص البحث
//   final TextEditingController searchController = TextEditingController();

//   @override
//   void onInit() {
//     super.onInit();
//     // 3. مزامنة البيانات فور تشغيل الكنترولر (لجلب صيدلية الشفاء والبيانات الوهمية)
//     _syncData();

//     // 4. مراقبة الدكشنري في الخدمة: أي إضافة صيدلية جديدة في صفحة التسجيل
//     // ستؤدي لتحديث القائمة هنا تلقائياً بفضل دالة ever
//     ever(_dataService.pharmaciesMap, (_) => _syncData());
//   }

//   // دالة مزامنة البيانات من الدكشنري (Map) إلى القائمة (List)
//   void _syncData() {
//     // نأخذ القيم (values) من الدكشنري ونحولها لقائمة
//     filteredPharmacies.assignAll(_dataService.pharmaciesMap.values.toList());
//   }

//   // 5. دالة البحث المطور (اسم الصيدلية + أسماء الأدوية)
//   void filterSearch(String query) {
//     if (query.isEmpty) {
//       _syncData();
//     } else {
//       String q = query.toLowerCase();
//       filteredPharmacies.assignAll(
//         _dataService.pharmaciesMap.values.where((pharmacy) {
//           // هل الاسم يطابق البحث؟
//           bool matchName = pharmacy.name.toLowerCase().contains(q);
          
//           // هل يوجد دواء داخل هذه الصيدلية يطابق البحث؟
//           bool matchMedicine = pharmacy.medicines.any(
//             (med) => med.name.toLowerCase().contains(q)
//           );
          
//           return matchName || matchMedicine;
//         }).toList(),
//       );
//     }
//   }

//   // 6. دالة اختيار صيدلية (الانتقال لصفحة التفاصيل)
//   void selectPharmacy(PharmacyModel pharmacy) {
//     Get.toNamed('/pharmacy-details', arguments: pharmacy);
//   }

//   // 7. دالة محاكاة جلب الصيدليات القريبة (Location)
//   Future<void> findNearestPharmacies() async {
//     try {
//       isLoading.value = true;
//       // محاكاة تأخير لجلب الموقع
//       await Future.delayed(const Duration(seconds: 1));
      
//       // هنا يمكن إضافة منطق ترتيب القائمة حسب المسافة لاحقاً
//       Get.snackbar(
//         "الموقع الجغرافي", 
//         "تم تحديث القائمة بناءً على موقعك الحالي",
//         snackPosition: SnackPosition.BOTTOM
//       );
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   @override
//   void onClose() {
//     searchController.dispose();
//     super.onClose();
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../services/auth_service.dart';
// import '../pharmacy_register/PharmacyRegisterModel.dart';

// class PharmacyListController extends GetxController {
//   // 1. الوصول لخدمة AuthService لجلب القائمة المشتركة (الوهمية حالياً)
//   final authService = Get.find<AuthService>();

//   // 2. المتغيرات المراقبة (تستخدم الموديل الموحد PharmacyRegisterModel)
//   var filteredPharmacies = <PharmacyRegisterModel>[].obs;
//   var isLoading = false.obs;
  
//   final TextEditingController searchController = TextEditingController();

//   @override
//   void onInit() {
//     super.onInit();
//     // تحميل البيانات عند فتح الصفحة
//     _loadPharmacies();
//   }

//   // 3. دالة تحميل الصيدليات من المصدر الموحد
//   void _loadPharmacies() {
//     isLoading.value = true;
    
//     // جلب القائمة من mockDatabase الموجودة في AuthService
//     // مستقبلاً هنا يتم استدعاء API لجلب كل الصيدليات من الباك إند
//     filteredPharmacies.assignAll(authService.mockDatabase);
    
//     isLoading.value = false;
//   }

//   // 4. دالة البحث والفلترة
//   void filterSearch(String query) {
//     if (query.isEmpty) {
//       // إعادة القائمة كاملة من المصدر
//       filteredPharmacies.assignAll(authService.mockDatabase);
//     } else {
//       String q = query.toLowerCase();
//       filteredPharmacies.assignAll(
//         authService.mockDatabase.where((pharmacy) {
//           // البحث في اسم الصيدلية، العنوان، أو أسماء الأدوية التي تمتلكها
//           bool matchPharmacyName = pharmacy.namePharmacy.toLowerCase().contains(q);
//           bool matchAddress = pharmacy.address.toLowerCase().contains(q);
//           bool matchMedicine = pharmacy.medicines.any(
//             (med) => med.name.toLowerCase().contains(q)
//           );
          
//           return matchPharmacyName || matchAddress || matchMedicine;
//         }).toList(),
//       );
//     }
//   }

//   // 5. دالة اختيار الصيدلية (الانتقال لصفحة تفاصيل الصيدلية للمستخدم)
//  // void selectPharmacy(PharmacyRegisterModel pharmacy) {
//     // نرسل كائن الصيدلية كاملاً لصفحة التفاصيل (PharmacyDetailsView)
//     // التي ستعرض أدوية هذه الصيدلية للمستخدم
//   //  Get.toNamed('/pharmacy-details', arguments: pharmacy);
//  // }

//   void selectPharmacy(PharmacyRegisterModel pharmacy) {
//     Get.toNamed('/pharmacy-details', arguments: pharmacy);
//    }

//   @override
//   void onClose() {
//     searchController.dispose();
//     super.onClose();
//   }
// }

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:project/api_service/api_service.dart'; // تأكد من المسار الصحيح
import 'package:project/app/modules/auth/pharmacy_register/PharmacyRegisterModel.dart';
import 'package:project/app/services/auth_service.dart';
 
class PharmacyListController extends GetxController {
  // تعريف الخدمات
  final ApiService apiService = ApiService();
  final authService = Get.find<AuthService>(); 

  // المتغيرات المرصودة
  var filteredPharmacies = <PharmacyRegisterModel>[].obs;
  var allPharmacies = <PharmacyRegisterModel>[].obs; 
  var isLoading = false.obs;

  // كنترولر البحث للواجهة
  final TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchPharmacies(); // جلب البيانات عند التشغيل
  }

  Future<void> fetchPharmacies() async {
    isLoading.value = true;
    try {
      // 1. جلب البيانات الوهمية (الموك) من الـ AuthService
      List<PharmacyRegisterModel> mocks = authService.mockDatabase;

      // 2. طلب البيانات من الباك اند (بنفس أسلوب اللوج ان اللي عملته)
      final response = await apiService.dio.get("/pharmacies");

      if (response.statusCode == 200) {
        // تحويل JSON القادم من الباك اند إلى قائمة موديلات
        List data = response.data;
        var serverList = data.map((e) => PharmacyRegisterModel.fromJson(e)).toList();

        // دمج بيانات السيرفر مع الموك في قائمة واحدة
        allPharmacies.assignAll([...serverList, ...mocks]);
      } else {
        // في حال كان الرد ليس 200 (مثلاً 500)، نكتفي بالموك
        allPharmacies.assignAll(mocks);
      }
    } catch (e) {
      // 3. في حال فشل السيرفر تماماً (أوفلاين)، نعرض بيانات الموك فقط
      print("خطأ في الاتصال بالباك اند: $e");
      allPharmacies.assignAll(authService.mockDatabase);
      
      Get.snackbar(
        "وضع الأوفلاين", 
        "فشل الاتصال بالسيرفر، يتم عرض البيانات المحلية",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.orange.withOpacity(0.8),
        colorText: Colors.white,
      );
    } finally {
      // تحديث قائمة الفلترة بالقائمة المدمجة
      filteredPharmacies.assignAll(allPharmacies);
      isLoading.value = false;
    }
  }

  // دالة البحث (تبحث في الاسم والعنوان)
  void filterSearch(String query) {
    if (query.isEmpty) {
      filteredPharmacies.assignAll(allPharmacies);
    } else {
      String q = query.toLowerCase();
      filteredPharmacies.assignAll(
        allPharmacies.where((pharmacy) => 
          pharmacy.namePharmacy.toLowerCase().contains(q) || 
          pharmacy.address.toLowerCase().contains(q)
        ).toList()
      );
    }
  }

  // الانتقال لصفحة التفاصيل مع تمرير كائن الصيدلية
  void selectPharmacy(PharmacyRegisterModel pharmacy) {
    Get.toNamed('/pharmacy-details', arguments: pharmacy);
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}