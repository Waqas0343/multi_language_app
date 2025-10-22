import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'app/theme/app_theme.dart';
import 'app/controllers/theme_controller.dart';
import 'app/modules/language/language_controller.dart';
import 'app/translations/app_translations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load saved theme
  final themeController = ThemeController();
  await themeController.loadThemeFromPrefs();

  // Load saved language
  final languageController = LanguageController();
  await languageController.loadSavedLanguage();

  runApp(MyApp(
    themeController: themeController,
    languageController: languageController,
  ));
}

class MyApp extends StatelessWidget {
  final ThemeController themeController;
  final LanguageController languageController;

  const MyApp({
    super.key,
    required this.themeController,
    required this.languageController,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(themeController);
    Get.put(languageController);

    return Obx(() => GetMaterialApp(
      title: 'Multi Language App',
      debugShowCheckedModeBanner: false,

      // THEMES
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeController.themeMode.value,

      // LANGUAGES
      translations: AppTranslations(),
      locale: languageController.selectedLocale.value,
      fallbackLocale: const Locale('en', 'US'),

      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    ));
  }
}
