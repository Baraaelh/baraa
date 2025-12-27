// lib/routes/app_pages.dart
import 'package:get/get.dart';
import 'package:project/app/modules/auth/AddMedicine/AddMedicine_View.dart';
import 'package:project/app/modules/auth/AddMedicine/AddMedicine_binding.dart';
import 'package:project/app/modules/auth/Cart/Cart_View.dart';
import 'package:project/app/modules/auth/Cart/Cart_binding.dart';
import 'package:project/app/modules/auth/ChangePassword/change_password_binding.dart';
import 'package:project/app/modules/auth/ChangePassword/change_password_view.dart';
import 'package:project/app/modules/auth/Inventory/Inventory_Controller.dart';
import 'package:project/app/modules/auth/Inventory/Inventory_View.dart';
import 'package:project/app/modules/auth/Notification/Notification_Home_binding.dart';
import 'package:project/app/modules/auth/Notification/Notifications_View.dart';
import 'package:project/app/modules/auth/PharmacistHome/Pharmacist_Home_Controller.dart';
import 'package:project/app/modules/auth/PharmacistHome/Pharmacist_Home_View.dart';
import 'package:project/app/modules/auth/PharmacyDetails/Pharmacy_Details_Binding.dart';
import 'package:project/app/modules/auth/PharmacyDetails/Pharmacy_Details_Controller.dart';
import 'package:project/app/modules/auth/PharmacyDetails/Pharmacy_Details_View.dart';
import 'package:project/app/modules/auth/Widget/main_layout_controller.dart';
 import 'package:project/app/modules/auth/home_user/home_controller.dart';
import 'package:project/app/modules/auth/home_user/home_view.dart';
import 'package:project/app/modules/auth/login/login_binding.dart';
import 'package:project/app/modules/auth/login_rgester/choice_binding.dart';
import 'package:project/app/modules/auth/login_rgester/choice_view.dart';
import 'package:project/app/modules/auth/pharmacies_choice/pharmacies_controller.dart';
import 'package:project/app/modules/auth/pharmacies_choice/pharmacies_view.dart';
import 'package:project/app/modules/auth/pharmacy_register/pharmacy_register_binding.dart';
import 'package:project/app/modules/auth/pharmacy_register/pharmacy_register_controller.dart';
import 'package:project/app/modules/auth/pharmacy_register/pharmacy_register_view.dart';
import 'package:project/app/modules/auth/pharmacy_verify/pharmacy_verify_binding.dart';
import 'package:project/app/modules/auth/pharmacy_verify/pharmacy_verify_view.dart';
  import 'package:project/app/modules/auth/register/register_binding.dart';
import 'package:project/app/modules/auth/login/login_view.dart';
import 'package:project/app/modules/auth/register/register_view.dart';
 import 'package:project/app/modules/auth/select_location/select_location_controller.dart';
import 'package:project/app/modules/auth/select_location/select_location_view.dart';
import 'package:project/app/modules/auth/select_role/select_role_binding.dart';
import 'package:project/app/modules/auth/select_role/select_role_view.dart';
 import 'package:project/app/modules/auth/setting_profile/settings_controller.dart';
import 'package:project/app/modules/auth/setting_profile/settings_view.dart';

import 'app_routes.dart';

class AppPages {

  static const INITIAL =AppRoutes.HOME ;  
  static final pages = [
    // 1. صفحة الرئيسية
    GetPage(
      name: AppRoutes.HOME,
      page: () => const HomeView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<HomeController>(() => HomeController());
        Get.lazyPut<MainLayoutController>(() => MainLayoutController());
      }),
    ),
    GetPage(
      name: AppRoutes.PHARMACY_Home,
      page: () => const PharmacistHomeView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<PharmacistHomeController>(() => PharmacistHomeController());
        Get.lazyPut<PharmacyRegisterController>(() => PharmacyRegisterController());
      }),
    ),

    // 2. صفحة الصيدليات

    
    GetPage(
      name: AppRoutes.PHARMACIES,
      page: () => const PharmacyListView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<PharmacyListController>(() => PharmacyListController());
        Get.lazyPut<MainLayoutController>(() => MainLayoutController());
        Get.lazyPut<PharmacyRegisterController>(() => PharmacyRegisterController());
        Get.lazyPut<PharmacyDetailsController>(() => PharmacyDetailsController());

 
      }
  
      
      )
      ),


    GetPage(
      name: AppRoutes.PHARMACY_DETAILS,
      page: () => const PharmacyDetailsView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<PharmacyDetailsController>(() => PharmacyDetailsController());
       // Get.lazyPut<CartBinding>(() => CartBinding());
 
 
      }
  
      
      )
      ),
    // GetPage(
    //   name: AppRoutes.Cart,
    //   page: () => const CartView(),
    //   binding: BindingsBuilder(() {
    //     Get.lazyPut<PharmacyDetailsBinding>(() => PharmacyDetailsBinding());
    //     Get.lazyPut<CartBinding>(() => CartBinding());
 
 
    //   }
  
      
    //   )
    //   ),

        GetPage(
      name: AppRoutes.register_pharmacy,
      page: () => const PharmacyRegisterView(),
      binding: PharmacyRegisterBinding(),
    ),

    GetPage(
      name: AppRoutes.Cart,
      page: () => const CartView(),
      binding:  CartBinding(),
 
 
    ),
   
  
    GetPage(
      name: AppRoutes.PHARMACY_DETAILS,
      page: () => const PharmacyDetailsView(),
      binding: PharmacyDetailsBinding(),
    ),


    GetPage(
      name: AppRoutes.Notifications,
      page: () => const NotificationsView(),
      binding: NotificationHomeBinding(),
    ),

    GetPage(
      name: AppRoutes.ADD_MEDICATION_LIST,
      page: () => const AddMedicationListView(),
      binding: AddMedicationListBinding(),
    ),
    // GetPage(
    //   name: AppRoutes.Cart,
    //   page: () => const CartView(),
    //   binding: CartBinding(),
    // ),

    GetPage(
  name: AppRoutes.STOCK,
  page: () => const InventoryView(),
  binding: BindingsBuilder(() {
    Get.lazyPut<InventoryController>(() => InventoryController());
  }),
),
    // GetPage(
    //   name: AppRoutes.PHARMACY_Home,
    //   page: () => const PharmacistHomeView(),
    //   binding: PharmacistHomeBinding(),

    //    ),
      

    // 3. صفحة الدردشة
    // GetPage(
    //   name: AppRoutes.CHAT,
    //   page: () => const ChatView(),
    //   binding: BindingsBuilder(() {
    //     Get.lazyPut<ChatController>(() => ChatController());
    //     Get.lazyPut<MainLayoutController>(() => MainLayoutController());
    //   }),
    // ),

    // 4. صفحة البروفايل (الإعدادات)
    GetPage(
      name: AppRoutes.PROFILE,
      page: () => const SettingsView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<SettingsController>(() => SettingsController());
        Get.lazyPut<MainLayoutController>(() => MainLayoutController());
      }),
    ),

    GetPage(
      name: AppRoutes.choice,
      page: () => SelectchiceView(),
      binding: SelectchoiceBinding(),
    ),
    GetPage(
      name: AppRoutes.SELECT_ROLE,
      page: () => SelectRoleView(),
      binding: SelectRoleBinding(),
    ),

    GetPage(
      name: AppRoutes.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.register_pharmacy,
      page: () => const PharmacyRegisterView(),
      binding: PharmacyRegisterBinding(),
    ),

    GetPage(
      name: AppRoutes.register,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: AppRoutes.pharmacy_verify,
      page: () => const PharmacyVerifyView(),
      binding: PharmacyVerifyBinding(),
    ),
    // GetPage(
    //   name: AppRoutes.home,
    //   page: () => const HomeView(),
    //   binding: HomeBinding(),
    // ),
    GetPage(
  name: AppRoutes.address_setup,
  page: () => const AddressView(),
  binding: BindingsBuilder(() => Get.lazyPut(() => AddressController())),
),
    GetPage(name: AppRoutes.ChangePassword,
            page: () => const ChangePasswordView(),
            binding: ChangePasswordBinding(),
    ),
    // GetPage(
    //   name: AppRoutes.setting_profile,
    //   page: () => const SettingsView(),
    //   binding: SettingsBinding(),
    // ),

    // GetPage(
    //   name: AppRoutes.products,
    //   page: () => const ProductsView(),
    //   binding: ProductsBinding(),
    // ),
    // GetPage(
    //   name: AppRoutes.home,
    //   page: () => const HomeView(),
    //   binding: MainLayoutBinding(), // مهم جداً
    // ),

    //     GetPage(
    //       name: AppRoutes.pharmacies_choice,
    //       page: () => const PharmaciesView(),
    //       binding: MainLayoutBinding(),
    //     ),
    //     // GetPage(
    //     //   name: '/chat',
    //     //   page: () => const ChatView(),
    //     //   binding: MainLayoutBinding(),
    //     // ),
    //     GetPage(
    //       name: AppRoutes.setting_profile,
    //       page: () => const SettingsView(),
    //       binding: MainLayoutBinding(),
    //     ),

    //     GetPage(
    //   name: AppRoutes.pharmacies_choice, // تأكد من مطابقة الاسم لديك
    //   page: () => const PharmaciesView(),
    //   binding: BindingsBuilder(() {
    //     // هذا السطر هو الذي يحل مشكلة الشاشة الحمراء
    //     Get.lazyPut<PharmaciesController>(() => PharmaciesController());

    //     // تأكد أيضاً من وجود كنترولر الشريط السفلي
    //     Get.lazyPut<MainLayoutController>(() => MainLayoutController());
    //   }),
    // ),
  ];
}

//class MainLayoutBinding extends Bindings {
  // @override
  // void dependencies() {
  //   // استخدم fenix: true ليبقى الكنترولر حياً عند التنقل بين هذه الصفحات
  //   Get.lazyPut(() => MainLayoutController(), fenix: true);
  // }

  // void dependencies1() {
  //   Get.lazyPut<PharmaciesController>(() => PharmaciesController());
  // }

