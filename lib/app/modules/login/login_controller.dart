import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';

class LoginController extends GetxController {
  final TextEditingController  emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final isLoading = false.obs;
  final isPasswordVisible = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void login() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      // Get.snackbar(
      //   'Error',
      //   'Please fill all fields',
      //   backgroundColor: Colors.redAccent,
      //   colorText: Colors.white,
      // );
      Get.toNamed(Routes.language);
      return;
    }
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;
    if (emailController.text == 'user@example.com' &&
        passwordController.text == '123456') {
      Get.offAllNamed(Routes.home);
    } else {
      Get.snackbar(
        'Invalid Credentials',
        'Please enter correct email or password',
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
