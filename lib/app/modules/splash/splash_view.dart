import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/app_text.dart';
import 'splash_controller.dart';

class SplashView extends GetView<SplashController> {
   const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDarkMode ?  Color(0xFF121212) : Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.flutter_dash,
              size: 100,
              color: isDarkMode ? Colors.blueAccent :  Color(0xFF3876F2),
            ),
             SizedBox(height: 20),
            CustomText(
              text:    'splash_title'.tr,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
             SizedBox(height: 8),
             CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
