import 'package:get/get.dart';
import 'package:project/app/modules/auth/AddMedicine/Medicine_Model.dart';
import '../modules/auth/pharmacy_register/PharmacyRegisterModel.dart'; // تأكد من المسار

class AuthService extends GetxService {
  // 1. المتغير الذي يحمل بيانات المستخدم المسجل دخوله حالياً
  final Rxn<PharmacyRegisterModel> currentPharmacy = Rxn<PharmacyRegisterModel>();

  // 2. قائمة "قاعدة البيانات الوهمية" (مشتركة بين اللوجين والريجستر)
  final List<PharmacyRegisterModel> mockDatabase = [
    // البيانات الافتراضية (صيدلية الشفاء)
    PharmacyRegisterModel(
      uid: "1",
      name: "براء الحداد",
      namePharmacy: "صيدلية الشفاء",
      address: "غزة - الرمال",
      phone: "0597347588",
      email: "shifa@gmail.com",
      image:'assets/images/Rectangle 9-2.png' ,
      password: "123",
      passwordConfirmation: "123",
      medicines: [
        MedicineModel(
            id: '1',
            name: 'Akmol',
            price: 6.0,
            quantity: 100,
            image: 'assets/images/Rectangle 9-2.png',
            description: 'مسكن للآلام')
      ],
    ),
  ];

  // دالة البحث في الوهمي (يستخدمها LoginController)
  PharmacyRegisterModel? findMockUser(String email, String password) {
    return mockDatabase.firstWhereOrNull(
        (user) => user.email == email && user.password == password);
  }

  // دالة الإضافة للوهمي (يستخدمها PharmacyRegisterController للتجربة)
  void addMockUser(PharmacyRegisterModel user) {
    mockDatabase.add(user);
    print("تمت إضافة ${user.namePharmacy} للقاعدة الوهمية. العدد الحالي: ${mockDatabase.length}");
  }

  // دالة تثبيت المستخدم الحالي (Session)
  void setUser(PharmacyRegisterModel user) {
    currentPharmacy.value = user;
    print("User Logged In: ${user.namePharmacy}, UID: ${user.uid}");
  }

  // الحصول على الـ UID بسهولة
  String? get currentUid => currentPharmacy.value?.uid;

  // تسجيل الخروج
  void logout() {
    currentPharmacy.value = null;
    Get.offAllNamed('/login');
  }
}