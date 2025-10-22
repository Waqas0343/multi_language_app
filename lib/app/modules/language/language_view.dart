import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';
import '../../widgets/app_text.dart';
import 'language_controller.dart';

class LanguageView extends GetView<LanguageController> {
   const LanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ?  Color(0xFF121212) : Colors.white,
      appBar: AppBar(
        title: CustomText(
          text:   'select_language'.tr,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: isDark ? Colors.grey[900] : Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: isDark ? Colors.white : Colors.black),
      ),
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(16),
          child: Column(

            children: [
              Expanded(
                child: Obx(()=> ListView.builder(
                    itemCount: controller.languages.length,
                    itemBuilder: (context, index) {
                      final lang = controller.languages[index];
                      final String name = lang['name'] as String;
                      final String native = lang['native'] as String;
                      final Locale locale = lang['locale'] as Locale;
                      final bool isSelected = controller.selectedLocale.value == locale;
                      return ListTile(
                        leading:CustomText(
                          text:  getFlag(locale),
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                        title:CustomText(
                          textAlign: TextAlign.left,
                          text: name,
                          fontWeight: FontWeight.bold,
                        ),
                        subtitle: CustomText(
                          textAlign: TextAlign.left,
                          text: native,
                          fontWeight: FontWeight.bold,
                        ),
                        trailing: isSelected
                            ?  Icon(Icons.check_circle,
                            color: Colors.amber)
                            : null,
                        onTap: () async {
                          await controller.selectLanguage(locale, context);
                          if (['ar', 'ur'].contains(locale.languageCode)) {
                            Get.updateLocale(locale);
                            Get.forceAppUpdate();
                          } else {
                            Get.updateLocale(locale);
                          }
                        },
                      );
                    },
                  ),
                ),
              ),
               SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () => Get.toNamed(Routes.home),
                  child: Text(
                    "select".tr,
                    style:  TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getFlag(Locale locale) {
    switch (locale.languageCode) {
      case 'en':
        return '🇺🇸';
      case 'es':
        return '🇪🇸';
      case 'fr':
        return '🇫🇷';
      case 'ar':
        return '🇸🇦';
      case 'zh':
        return '🇨🇳';
      case 'de':
        return '🇩🇪';
      case 'it':
        return '🇮🇹';
      case 'ja':
        return '🇯🇵';
      case 'ko':
        return '🇰🇷';
      case 'ur':
        return '🇵🇰';
      default:
        return '🌐';
    }
  }
}
