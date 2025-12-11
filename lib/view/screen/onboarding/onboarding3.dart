import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';

class Onboarding3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Image.asset('assets/images/onboarding3.png', fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Text(
                    'عنوان الترحيب الثالث',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'وصف يوضح سبب فائدة التطبيق.',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () => Get.toNamed(AppRoutes.onboarding4),
              child: Text('التالي'),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
