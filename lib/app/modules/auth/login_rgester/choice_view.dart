import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:project/app/modules/auth/login_rgester/choice_controller.dart';

class SelectchiceView extends GetView<SelectChoiceController> {
  const SelectchiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _roleCard(
              title: "تسجيل الدخول",
              role: "login",
              icon: Icons.login,
            ),
            const SizedBox(height: 20),
            _roleCard(
              title: "إنشاء حساب",
              role: "register",
              icon: Icons.person_add,
            ),
          ],
        ),
      ),
    );
  }

  Widget _roleCard({
    required String title,
    required String role,
    required IconData icon,
  }) {
    return InkWell(
      onTap: () => controller.selectchoice(role),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 260,
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(
              icon,
              size: 42,
              color: Colors.blue,
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
