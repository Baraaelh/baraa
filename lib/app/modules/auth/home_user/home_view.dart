// lib/app/modules/home/views/home_view.dart

// lib/app/modules/home/views/home_view.dart

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/modules/auth/Widget/common_bottom_nav.dart';
// تأكد من صحة مسار الـ CustomScaffold في مشروعك
import '../select_location/select_location_view.dart';

// الألوان الموحدة
const Color primaryColor = Color(0xFF4CAF50);
const Color lightGreen = Color(0xFFE8F5E9);
const Color darkGreen = Color(0xFF388E3C);
const Color cardBackground = Color(0xFFF5F5F5);

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // نستخدم CustomScaffold بدلاً من Scaffold العادي لضمان بقاء الشريط السفلي
    return CustomScaffold(
      index: 0, // لتفعيل أيقونة "الرئيسية"
      body: Column(
        children: [
          _buildTopSection(),
          _buildSearchBar(),
          const SizedBox(height: 15),
          _buildUploadImageSection(),
          const SizedBox(height: 25),
          _buildCategoriesSection(),
          const SizedBox(height: 25),
          _buildTrendingSection(),
          const SizedBox(height: 25),
          _buildOffersSection('عروض جديدة', [
            {
              'name': 'Insulin',
              'price': '\$3,250',
              'img': 'assets/images/Rectangle10.png',
              'desc': 'Vital hormone for sugar levels.'
            },
            {
              'name': 'Vitamin C',
              'price': '\$120',
              'img': 'assets/images/Rectangle17.png',
              'desc': 'Boost your immunity daily.'
            },
          ]),
          const SizedBox(height: 25),
          _buildFeaturedSection(),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  // --- دوال بناء الـ UI (نفس الـ UI/UX الذي طلبته تماماً) ---

  // 1. القسم العلوي (التوصيل وسلة التسوق)
 // الجزء المعدل في دالة _buildTopSection داخل HomeView.dart

Widget _buildTopSection() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // السلة مع جرس الإشعارات
        Row(
          children: [
            // أيقونة جرس الإشعارات (إضافة جديدة)
            IconButton(
              icon: const Icon(Icons.notifications_none_outlined, color: darkGreen, size: 28),
              onPressed: () {
                // Get.toNamed('/notifications'); // سنقوم ببرمجتها لاحقاً
              },
            ),
            // أيقونة السلة (أصبحت قابلة للضغط)
            IconButton(
              icon: const Icon(Icons.shopping_cart_outlined, color: darkGreen, size: 28),
              onPressed: () => Get.toNamed('/Cart_View'), // التوجه لصفحة السلة
            ),
          ],
        ),
        
        // قسم العنوان (موقع التوصيل)
        Row(
          children: [
            RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black, fontSize: 14),
                children: [
                  const TextSpan(text: 'التوصيل إلى '),
                  TextSpan(
                    text: 'موقعك',
                    style: const TextStyle(
                      color: darkGreen,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.toNamed('/select_location_view'),
                  ),
                ],
              ),
            ),
            const Icon(Icons.keyboard_arrow_down, color: darkGreen, size: 20),
          ],
        ),
        
        // زر الإضافة الدائري
        Container(
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(color: darkGreen, shape: BoxShape.circle),
          child: const Icon(Icons.add, color: Colors.white, size: 20),
        ),
      ],
    ),
  );
}

  // 2. شريط البحث
  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: lightGreen.withOpacity(0.5),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: const TextField(
          textAlign: TextAlign.right,
          decoration: InputDecoration(
            hintText: 'ماذا تريد أن تبحث؟',
            prefixIcon: Icon(Icons.search, color: Colors.grey),
            suffixIcon: Icon(Icons.camera_alt_outlined, color: Colors.grey),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  // 3. قسم رفع الصورة (الروشتة)
  Widget _buildUploadImageSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300, style: BorderStyle.solid),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('أضف صورة الروشتة أو المنتج هنا',
                style: TextStyle(color: Colors.grey.shade600)),
            const SizedBox(width: 10),
            const Icon(Icons.camera_alt_outlined, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  // 4. الأقسام
  Widget _buildCategoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 15),
          child: Text('الأقسام',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 140,
          child: ListView(
            scrollDirection: Axis.horizontal,
            reverse: true,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            children: [
              _categoryCard('العناية بالشعر', 'assets/images/Rectangle32.png', Colors.teal),
              _categoryCard('العناية بالبشرة', 'assets/images/Rectangle33.png', Colors.pinkAccent),
              _categoryCard('الأسنان', 'assets/images/Rectangle34.png', Colors.blueAccent),
            ],
          ),
        ),
      ],
    );
  }

  Widget _categoryCard(String title, String img, Color color) {
    return Container(
      width: 110,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [color.withOpacity(0.8), Colors.transparent],
          ),
        ),
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.all(8),
        child: Text(title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
      ),
    );
  }

  // 5. الأكثر مبيعاً
  Widget _buildTrendingSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 15),
          child: Text('الأكثر مبيعاً',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            reverse: true,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            children: [
              _productCard('Hair Cream', '\$55', 'assets/images/Rectangle10.png'),
              _productCard('Aidmel', '\$45', 'assets/images/Rectangle17.png'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _productCard(String name, String price, String img) {
    return Container(
      width: 150,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: cardBackground,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover),
              ),
              child: const Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.favorite_border, color: Colors.white, size: 20),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(price,
                        style: const TextStyle(
                            color: darkGreen, fontWeight: FontWeight.bold)),
                    const Icon(Icons.add_shopping_cart, size: 18, color: darkGreen),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 6. قسم العروض
  Widget _buildOffersSection(String title, List<Map<String, String>> data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Text(title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 10),
        ...data.map((item) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 10)
                ],
              ),
              child: Row(
                children: [
                  Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage(item['img']!), fit: BoxFit.cover))),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(item['name']!,
                            style: const TextStyle(fontWeight: FontWeight.bold)),
                        Text(item['desc']!,
                            style: const TextStyle(fontSize: 12, color: Colors.grey),
                            textAlign: TextAlign.right),
                        Text(item['price']!,
                            style: const TextStyle(
                                color: darkGreen, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
            )).toList(),
      ],
    );
  }

  // 7. الأكثر تميزاً
  Widget _buildFeaturedSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 15),
          child: Text('الأكثر تميزاً',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            reverse: true,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            children: [
              _smallImgCard('assets/images/Rectangle47.png'),
              _smallImgCard('assets/images/Rectangle48.png'),
              _smallImgCard('assets/images/Rectangle49.png'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _smallImgCard(String img) {
    return Container(
      width: 100,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover),
      ),
    );
  }
}

  // Widget _buildBottomNavBar() {
  //   return Container(
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       border: Border(top: BorderSide(color: Colors.grey.shade300, width: 1)),
  //     ),
  //     child: BottomNavigationBar(
  //       elevation: 0,
  //       backgroundColor: Colors.white,
  //       selectedItemColor: darkGreen,
  //       unselectedItemColor: Colors.grey[600],
  //       showSelectedLabels: false,
  //       showUnselectedLabels: false,
  //       currentIndex: _selectedIndex,
  //       onTap: _onItemTapped,
  //       items: const [
  //         BottomNavigationBarItem(icon: Icon(Icons.home_filled, size: 28), label: 'الرئيسية'),
  //         BottomNavigationBarItem(icon: Icon(Icons.category_outlined, size: 28), label: 'الأقسام'),
  //         BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline, size: 28), label: 'الدردشة'),
  //         BottomNavigationBarItem(icon: Icon(Icons.person_outline, size: 28), label: 'الحساب'),
  //       ],
  //     ),
  //   );
  // }





// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'home_controller.dart';

// // Colors
// const Color primaryColor = Color(0xFF4CAF50);
// const Color lightGreen = Color(0xFFE8F5E9);
// const Color darkGreen = Color(0xFF388E3C);
// const Color cardBackground = Color(0xFFE0E0E0);
// const Color mainBackground = Colors.white;

// class HomeView extends GetView<HomeController> {
//   const HomeView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: mainBackground,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               _buildTopSection(),
//               _buildSearchBar(),
//               _buildUploadImageSection(),
//               const SizedBox(height: 15),
//               _buildTrendingSection(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTopSection() {
//     return Padding(
//       padding: const EdgeInsets.all(15),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: const [
//           Icon(Icons.shopping_cart_outlined, color: darkGreen),
//           Text(
//             'الرئيسية',
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildSearchBar() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 15),
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 15),
//         decoration: BoxDecoration(
//           color: lightGreen.withOpacity(0.6),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: const TextField(
//           textAlign: TextAlign.right,
//           decoration: InputDecoration(
//             hintText: 'ابحث عن دواء أو منتج...',
//             border: InputBorder.none,
//             icon: Icon(Icons.search),
//           ),
//         ),
//       ),
//     );
//   }



//   Widget _buildUploadImageSection() {
//     return Padding(
//       padding: const EdgeInsets.all(15),
//       child: Container(
//         padding: const EdgeInsets.all(15),
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.grey),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: const [
//             Icon(Icons.camera_alt_outlined),
//             Text('أضف صورة الوصفة أو المنتج'),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildTrendingSection() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.end,
//       children: [
//         const Padding(
//           padding: EdgeInsets.only(right: 15),
//           child: Text(
//             'الأكثر مبيعاً',
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//         ),
//         const SizedBox(height: 10),
//         Obx(() {
//           if (controller.isLoading.value) {
//             return const Center(child: CircularProgressIndicator());
//           }

//           return SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             padding: const EdgeInsets.symmetric(horizontal: 15),
//             child: Row(
//               textDirection: TextDirection.rtl,
//               children: controller.products.map((product) {
//                 return Padding(
//                   padding: const EdgeInsets.only(left: 10),
//                   child: _buildProductCard(product),
//                 );
//               }).toList(),
//             ),
//           );
//         }),
//       ],
//     );
//   }

//   Widget _buildProductCard(product) {
//     return Container(
//       width: 150,
//       height: 190,
//       decoration: BoxDecoration(
//         color: cardBackground.withOpacity(0.5),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Column(
//         children: [
//           Container(
//             height: 100,
//             decoration: BoxDecoration(
//               borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
//               image: DecorationImage(
//                 image: NetworkImage(product.image),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold)),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text('${product.price}', style: const TextStyle(color: darkGreen)),
//                     Text('${product.quantity}', style: const TextStyle(color: Colors.grey)),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
