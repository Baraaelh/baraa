import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:project/app/modules/auth/select_role/select_role_controller.dart';

class SelectRoleView extends GetView<SelectRoleController> {
  const SelectRoleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _roleCard(
              title: "مستخدم",
              role: "user",
              icon: Icons.person,
            ),
            const SizedBox(height: 20),
            _roleCard(
              title: "صيدلية",
              role: "pharmacy",
              icon: Icons.local_pharmacy,
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
      onTap: () => controller.selectRole(role),
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
              size: 40,
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
