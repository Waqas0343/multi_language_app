import 'dart:async';
import 'dart:ui';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() async {
    final prefs = await SharedPreferences.getInstance();
    final langCode = prefs.getString('languageCode');
    final countryCode = prefs.getString('countryCode');
    if (langCode != null && countryCode != null) {
      Get.updateLocale(Locale(langCode, countryCode));
    }
    Timer(const Duration(seconds: 3), () {
      Get.offNamed(Routes.login);
    });
  }
}
