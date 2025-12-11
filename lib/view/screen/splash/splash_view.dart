import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/splash_controller.dart';

class SplashView extends StatelessWidget {
  SplashView({super.key});

  final controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(
          "assets/images/splash_anim.gif",
          width: 180,
        ),
      ),
    );
  }
}
