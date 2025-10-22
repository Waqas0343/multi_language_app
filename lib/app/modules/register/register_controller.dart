import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';

class RegisterController extends GetxController {
  final TextEditingController  nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void register() {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      Get.offAllNamed(Routes.home);
      // Get.snackbar('Error', 'All fields are required');
      return;
    }

    // Simulate registration success
    Get.snackbar('Success', 'Registration successful!');
    Future.delayed(const Duration(seconds: 1), () {
      Get.offAllNamed(Routes.home);
    });
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
