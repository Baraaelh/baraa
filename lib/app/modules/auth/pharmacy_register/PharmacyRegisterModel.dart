// 1. موديل الدواء (MedicineModel)
// class MedicineModel {
//   final String id;
//   final String name;
//   final double price;
//   int quantity;
//   final String image;
//   final String description;

//   MedicineModel({
//     required this.id,
//     required this.name,
//     required this.price,
//     required this.quantity,
//     required this.image,
//     required this.description,
//   });

//   // تحويل من JSON
//   factory MedicineModel.fromJson(Map<String, dynamic> json) {
//     return MedicineModel(
//       id: json['id']?.toString() ?? '',
//       name: json['name'] ?? '',
//       price: (json['price'] ?? 0).toDouble(),
//       quantity: json['quantity'] ?? 0,
//       image: json['image'] ?? '',
//       description: json['description'] ?? '',
//     );
//   }

//   // تحويل إلى JSON
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//       'price': price,
//       'quantity': quantity,
//       'image': image,
//       'description': description,
//     };
//   }
// }

// 2. موديل الصيدلية الكامل (PharmacyRegisterModel)
import 'package:project/app/modules/auth/AddMedicine/Medicine_Model.dart';

class PharmacyRegisterModel {
  final String? uid; // المعرف الفريد من الباك إند
  final String name; // اسم الصيدلي
  final String namePharmacy; // اسم الصيدلية
  final String address;
  final String phone;
  final String email;
  final String? image; // صورة الصيدلية
  final String password;
  final String passwordConfirmation;
   List<MedicineModel> medicines; // قائمة الأدوية المرتبطة

  PharmacyRegisterModel({
    this.uid,
    required this.name,
    required this.namePharmacy,
    required this.address,
    required this.phone,
    required this.email,
    this.image,
    required this.password,
    required this.passwordConfirmation,
    this.medicines = const [], // تبدأ بقائمة فارغة
  });

  // تحويل البيانات من Model إلى JSON لإرسالها للـ API (عند التسجيل)
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'name_pharmacy': namePharmacy,
      'address': address,
      'phone': phone,
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation,
      // نرسل فقط معرفات الأدوية إذا لزم الأمر، أو نتركها فارغة عند التسجيل
      'medicines': medicines.map((m) => m.toJson()).toList(),
    };
  }

  // استقبال البيانات من الـ API (عند تسجيل الدخول)
  factory PharmacyRegisterModel.fromJson(Map<String, dynamic> json) {
    return PharmacyRegisterModel(
      uid: json['uid']?.toString() ?? json['id']?.toString(), // دعم اختلاف المسميات من الباك
      name: json['name'] ?? '',
      namePharmacy: json['name_pharmacy'] ?? json['namePharmacy'] ?? '',
      address: json['address'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      image: json['image'] ?? 'assets/images/default_pharmacy.png',
      password: '', // لا نسترجع كلمة المرور من API للأمان
      passwordConfirmation: '',
      // تحويل قائمة الأدوية القادمة من JSON إلى قائمة Objects
      medicines: json['medicines'] != null
          ? (json['medicines'] as List)
              .map((m) => MedicineModel.fromJson(m))
              .toList()
          : [],
    );
  }
}