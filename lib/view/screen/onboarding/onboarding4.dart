import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';

class Onboarding4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Image.asset('assets/images/onboarding4.png', fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Text(
                    'استمتع بالتطبيق',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'هنا وصف مختصر يشجع المستخدمين على البدء.',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () => Get.offAllNamed(AppRoutes.login),
              child: Text('ابدأ الآن'),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
