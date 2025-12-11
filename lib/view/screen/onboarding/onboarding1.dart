import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/onboarding_controller.dart';
import '../../../routes/app_routes.dart';

class Onboarding1 extends StatelessWidget {
  final controller = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Image.asset('assets/images/onboarding1.png', fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Text(
                    'عنوان الترحيب الأول',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'هنا وصف قصير يشرح فكرة التطبيق للمستخدم.',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () => Get.toNamed(AppRoutes.onboarding2),
              child: Text('التالي'),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
