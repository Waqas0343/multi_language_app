import 'package:get/get.dart';
import '../modules/home/home_binding.dart';
import '../modules/home/home_view.dart';
import '../modules/language/language_binding.dart';
import '../modules/language/language_view.dart';
import '../modules/login/login_binding.dart';
import '../modules/login/login_screen.dart';
import '../modules/profile/profile_binding.dart';
import '../modules/profile/profile_view.dart';
import '../modules/register/register_binding.dart';
import '../modules/register/register_view.dart';
import '../modules/settings/settings_binding.dart';
import '../modules/settings/settings_view.dart';
import '../modules/splash/splash_binding.dart';
import '../modules/splash/splash_view.dart';
import 'app_routes.dart';

class AppPages {
  static const initial = Routes.splash;
  static final routes = [
    GetPage(name: Routes.splash, page: () =>  SplashView(), binding: SplashBinding()),
    GetPage(name: Routes.login, page: () =>  LoginView(), binding: LoginBinding()),
    GetPage(name: Routes.register, page: () =>  RegisterView(), binding: RegisterBinding()),
    GetPage(name: Routes.language, page: () =>  LanguageView(), binding: LanguageBinding()),
    GetPage(name: Routes.home, page: () =>  HomeView(), binding: HomeBinding()),
    GetPage(name: Routes.profile, page: () =>  ProfileView(), binding: ProfileBinding()),
    GetPage(name: Routes.settings, page: () =>  SettingsView(), binding: SettingsBinding()),
  ];
}
