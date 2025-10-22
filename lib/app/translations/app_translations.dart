import 'package:get/get.dart';
import 'en_US.dart';
import 'es_ES.dart';
import 'fr_FR.dart';
import 'ar_SA.dart';
import 'zh_CN.dart';
import 'de_DE.dart';
import 'it_IT.dart';
import 'ja_JP.dart';
import 'ko_KR.dart';
import 'ur_PK.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': enUS,
    'es_ES': esES,
    'fr_FR': frFR,
    'ar_SA': arSA,
    'zh_CN': zhCN,
    'de_DE': deDE,
    'it_IT': itIT,
    'ja_JP': jaJP,
    'ko_KR': koKR,
    'ur_PK': urPK,
  };
}
