import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';

class Onboarding2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Image.asset('assets/images/onboarding2.png', fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Text(
                    'عنوان الترحيب الثاني',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'وصف ثاني يوضح مزايا التطبيق للمستخدم.',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () => Get.toNamed(AppRoutes.onboarding3),
              child: Text('التالي'),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
