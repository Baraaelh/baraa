// // // lib/app/data/services/pharmacy_data_service.dart
// // import 'package:get/get.dart';
// // import 'package:get_storage/get_storage.dart';
// // import 'package:project/app/modules/auth/pharmacies_choice/PharmacyModel.dart';

// // class PharmacyDataService extends GetxService {
// //   final _storage = GetStorage();
// //   final String _key = 'pharmacies_data';
  
// //   // الدكشنري الأساسي (الخريطة)
// //   var pharmaciesMap = <int, PharmacyModel>{}.obs;

// //   Future<PharmacyDataService> init() async {
// //     await loadFromStorage();
// //     if (pharmaciesMap.isEmpty) {
// //       _loadInitialMockData(); // تحميل بيانات افتراضية لأول مرة فقط
// //     }
// //     return this;
// //   }

// //   void _loadInitialMockData() {
// //     addOrUpdatePharmacy(PharmacyModel(
// //       id: 1,
// //       name: "صيدلية الشفاء",
// //       address: "غزة - الرمال",
// //       image: "assets/images/pharmacy1.png",
// //       medicines: [MedicineModel(id: 101, name: "بندول", image: "assets/images/med1.png", price: 15.0)],
// //     ));
// //   }

// //   // إضافة صيدلية جديدة أو تحديث موجودة
// //   void addOrUpdatePharmacy(PharmacyModel pharmacy) {
// //     pharmaciesMap[pharmacy.id] = pharmacy;
// //     saveToStorage();
// //     pharmaciesMap.refresh();
// //   }

// //   // حفظ الدكشنري بالكامل في ذاكرة الهاتف
// //   void saveToStorage() {
// //     Map<String, dynamic> dataToSave = {};
// //     pharmaciesMap.forEach((key, value) {
// //       dataToSave[key.toString()] = value.toJson();
// //     });
// //     _storage.write(_key, dataToSave);
// //   }

// //   // استرجاع البيانات عند فتح التطبيق
// //   Future<void> loadFromStorage() async {
// //     final savedData = _storage.read(_key);
// //     if (savedData != null) {
// //       Map<String, dynamic> data = Map<String, dynamic>.from(savedData);
// //       data.forEach((key, value) {
// //         pharmaciesMap[int.parse(key)] = PharmacyModel.fromJson(value);
// //       });
// //     }
// //   }
// // }

//  import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:project/app/modules/auth/pharmacies_choice/PharmacyModel.dart';
 
// class PharmacyDataService extends GetxService {
//   final storage = GetStorage();
//   // الدكشنري المركزي الذي يخزن الكائنات كاملة
//   var pharmaciesMap = <int, PharmacyModel>{}.obs;

//   Future<PharmacyDataService> init() async {
//     await loadFromStorage();
//     // إضافة صيدلية الشفاء افتراضياً إذا كان التطبيق فارغاً
//     if (pharmaciesMap.isEmpty) {
//       _loadInitialMockData();
//     }
//     return this;
//   }

//   // إضافة صيدلية جديدة من صفحة التسجيل
//   void addOrUpdatePharmacy(PharmacyModel pharmacy) {
//     pharmaciesMap[pharmacy.id] = pharmacy;
//     _saveToStorage();
//     pharmaciesMap.refresh(); // تنبيه المراقبين (Controllers)
//   }

//   void _saveToStorage() {
//     Map<String, dynamic> data = {};
//     pharmaciesMap.forEach((key, value) => data[key.toString()] = value.toJson());
//     storage.write('pharmacies_key', data);
//   }

//   Future<void> loadFromStorage() async {
//     final saved = storage.read('pharmacies_key');
//     if (saved != null) {
//       Map<String, dynamic> data = Map<String, dynamic>.from(saved);
//       data.forEach((key, value) {
//         pharmaciesMap[int.parse(key)] = PharmacyModel.fromJson(value);
//       });
//     }
//   }

//   void _loadInitialMockData() {
//     addOrUpdatePharmacy(PharmacyModel(
//       id: 1,
//       name: "صيدلية الشفاء",
//       address: "غزة - الرمال",
//       licenseNumber: 100200,
//       phone: 0597347588,
//       email: "baraa@gmail.com",
//       image: "assets/images/pharmacy1.png",
//       medicines: [MedicineModel(id: 101, name: "بندول", image: "assets/images/med1.png", price: 15.0)],
       
//     ));
//   }
// }