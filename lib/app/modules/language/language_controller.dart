import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageController extends GetxController {
  RxList<Map<String, dynamic>> languages = <Map<String, dynamic>>[
    {'name': 'English', 'native': 'English', 'locale':  Locale('en', 'US')},
    {'name': 'Spanish', 'native': 'Español', 'locale':  Locale('es', 'ES')},
    {'name': 'French', 'native': 'Français', 'locale':  Locale('fr', 'FR')},
    {'name': 'Arabic (Saudi Arabia)', 'native': 'العربية - السعودية', 'locale':  Locale('ar', 'SA')},
    {'name': 'Arabic (Jordan)', 'native': 'العربية - الأردن', 'locale':  Locale('ar', 'AR')},
    {'name': 'Chinese', 'native': '中文', 'locale':  Locale('zh', 'CN')},
    {'name': 'German', 'native': 'Deutsch', 'locale':  Locale('de', 'DE')},
    {'name': 'Italian', 'native': 'Italiano', 'locale':  Locale('it', 'IT')},
    {'name': 'Japanese', 'native': '日本語', 'locale':  Locale('ja', 'JP')},
    {'name': 'Korean', 'native': '한국어', 'locale':  Locale('ko', 'KR')},
    {'name': 'Urdu', 'native': 'اردو', 'locale':  Locale('ur', 'PK')},
  ].obs;


  Rx<Locale> selectedLocale =  Locale('en', 'US').obs;

  @override
  void onInit() {
    super.onInit();
    loadSavedLanguage();
  }

  Future<void> loadSavedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final langCode = prefs.getString('languageCode');
    final countryCode = prefs.getString('countryCode');
    if (langCode != null && countryCode != null) {
      selectedLocale.value = Locale(langCode, countryCode);
      Get.updateLocale(selectedLocale.value);
    }
  }

  Future<void> selectLanguage(Locale locale, BuildContext context) async {
    selectedLocale.value = locale;
    Get.updateLocale(locale);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('languageCode', locale.languageCode);
    await prefs.setString('countryCode', locale.countryCode ?? '');
  }
}
