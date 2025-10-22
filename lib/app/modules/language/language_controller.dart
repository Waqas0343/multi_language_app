import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageController extends GetxController {
  RxList<Map<String, dynamic>> languages = <Map<String, dynamic>>[
    {'name': 'English', 'native': 'English', 'locale': const Locale('en', 'US')},
    {'name': 'Spanish', 'native': 'Español', 'locale': const Locale('es', 'ES')},
    {'name': 'French', 'native': 'Français', 'locale': const Locale('fr', 'FR')},
    {'name': 'Arabic', 'native': 'العربية', 'locale': const Locale('ar', 'SA')},
    {'name': 'Chinese', 'native': '中文', 'locale': const Locale('zh', 'CN')},
    {'name': 'German', 'native': 'Deutsch', 'locale': const Locale('de', 'DE')},
    {'name': 'Italian', 'native': 'Italiano', 'locale': const Locale('it', 'IT')},
    {'name': 'Japanese', 'native': '日本語', 'locale': const Locale('ja', 'JP')},
    {'name': 'Korean', 'native': '한국어', 'locale': const Locale('ko', 'KR')},
    {'name': 'Urdu', 'native': 'اردو', 'locale': const Locale('ur', 'PK')},
  ].obs;

  Rx<Locale> selectedLocale = const Locale('en', 'US').obs;

  @override
  void onInit() {
    super.onInit();
    loadSavedLanguage();
  }

  /// Load saved locale from preferences
  Future<void> loadSavedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final langCode = prefs.getString('languageCode');
    final countryCode = prefs.getString('countryCode');
    if (langCode != null && countryCode != null) {
      selectedLocale.value = Locale(langCode, countryCode);
      Get.updateLocale(selectedLocale.value);
    }
  }

  /// Save selected locale
  Future<void> selectLanguage(Locale locale, BuildContext context) async {
    selectedLocale.value = locale;
    Get.updateLocale(locale);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('languageCode', locale.languageCode);
    await prefs.setString('countryCode', locale.countryCode ?? '');
  }
}
