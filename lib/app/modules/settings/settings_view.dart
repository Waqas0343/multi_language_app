import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/theme_controller.dart';
import '../../widgets/app_text.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();

    return Obx(() {
      final isDark = themeController.themeMode.value == ThemeMode.dark;

      return Scaffold(
        appBar: AppBar(
          title: const CustomText(
            text: 'Settings',
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          centerTitle: true,
          backgroundColor: isDark ? Colors.grey[900] : Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
        body: Center(
          child: SwitchListTile(
            title: CustomText(
              text: isDark ? "Dark Mode" : "Light Mode",
              fontWeight: FontWeight.w600,
            ),
            value: isDark,
            onChanged: (value) => themeController.setTheme(value),
          ),
        ),
      );
    });
  }
}
