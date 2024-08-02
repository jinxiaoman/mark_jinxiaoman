import 'package:get/get.dart';

import '../modules/about/about_binding.dart';
import '../modules/about/about_view.dart';
import '../modules/dynamic/dynamic_binding.dart';
import '../modules/dynamic/dynamic_view.dart';
import '../modules/home/home_binding.dart';
import '../modules/home/home_view.dart';
import '../modules/login/login_binding.dart';
import '../modules/login/login_view.dart';
import '../modules/policy/modules/privacy/privacy_binding.dart';
import '../modules/policy/modules/privacy/privacy_view.dart';
import '../modules/policy/modules/user/user_binding.dart';
import '../modules/policy/modules/user/user_view.dart';
import '../modules/policy/policy_binding.dart';
import '../modules/policy/policy_view.dart';
import '../modules/profile/profile_binding.dart';
import '../modules/profile/profile_view.dart';
import '../modules/register/register_binding.dart';
import '../modules/register/register_view.dart';
import '../modules/settings/modules/account/account_binding.dart';
import '../modules/settings/modules/account/account_view.dart';
import '../modules/settings/modules/theme/theme_binding.dart';
import '../modules/settings/modules/theme/theme_view.dart';
import '../modules/settings/settings_binding.dart';
import '../modules/settings/settings_view.dart';
import '../modules/tabbar/tabbar_binding.dart';
import '../modules/tabbar/tabbar_view.dart';
import '../modules/webview/webview_binding.dart';
import '../modules/webview/webview_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.TABBAR;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.TABBAR,
      page: () => const TabbarView(),
      binding: TabbarBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
      children: [
        GetPage(
          name: _Paths.THEME,
          page: () => const ThemeView(),
          binding: ThemeBinding(),
        ),
        GetPage(
          name: _Paths.ACCOUNT,
          page: () => const AccountView(),
          binding: AccountBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.ABOUT,
      page: () => const AboutView(),
      binding: AboutBinding(),
    ),
    GetPage(
      name: _Paths.DYNAMIC,
      page: () => const DynamicView(),
      binding: DynamicBinding(),
    ),
    GetPage(
      name: _Paths.WEBVIEW,
      page: () => const WebviewView(),
      binding: WebviewBinding(),
    ),
    GetPage(
      name: _Paths.POLICY,
      page: () => const PolicyView(),
      binding: PolicyBinding(),
      children: [
        GetPage(
          name: _Paths.USER,
          page: () => const UserView(),
          binding: UserBinding(),
        ),
        GetPage(
          name: _Paths.PRIVACY,
          page: () => const PrivacyView(),
          binding: PrivacyBinding(),
        ),
      ],
    ),
  ];
}
