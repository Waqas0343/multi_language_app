import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_text.dart';
import '../../widgets/app_text_field.dart';
import 'register_controller.dart';

class RegisterView extends GetView<RegisterController> {
   const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Get.isDarkMode;
    return Scaffold(
      backgroundColor: isDark ? Colors.black : Colors.white,
      appBar: AppBar(
        title:  CustomText(
          text: 'Register Account',
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        centerTitle: true,
        backgroundColor: isDark ? Colors.grey[900] : Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: isDark ? Colors.white : Colors.black),
      ),
      body: Padding(
        padding:  EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomText(
              text:  'Join Us ',
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 8),
            CustomText(
              text:   'Login to continue using the app',
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 40),
            CustomTextField(controller: controller.nameController, hintText: 'Full Name'),
             SizedBox(height: 16),
            CustomTextField(controller: controller.emailController, hintText: 'Email'),
             SizedBox(height: 16),
            CustomTextField(
              controller: controller.passwordController,
              hintText: 'Password',
              obscureText: true,
            ),
             SizedBox(height: 24),
            CustomButton(
              label: 'Register',
              onPressed: controller.register,
            ),
             SizedBox(height: 20),
            GestureDetector(
              onTap: () => Get.back(),
              child:  CustomText(
                text: 'Already have an account? Login',
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
