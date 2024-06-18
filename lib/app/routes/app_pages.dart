import 'package:get/get.dart';

import '../modules/about/bindings/about_binding.dart';
import '../modules/about/views/about_view.dart';
import '../modules/dynamic/bindings/dynamic_binding.dart';
import '../modules/dynamic/views/dynamic_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/policy/bindings/policy_binding.dart';
import '../modules/policy/views/policy_view.dart';
import '../modules/policy/modules/privacy/bindings/privacy_binding.dart';
import '../modules/policy/modules/privacy/views/privacy_view.dart';
import '../modules/policy/modules/user/bindings/user_binding.dart';
import '../modules/policy/modules/user/views/user_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/settings/modules/account/bindings/account_binding.dart';
import '../modules/settings/modules/account/views/account_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/modules/theme/bindings/theme_binding.dart';
import '../modules/settings/modules/theme/views/theme_view.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/tabbar/bindings/tabbar_binding.dart';
import '../modules/tabbar/views/tabbar_view.dart';
import '../modules/webview/bindings/webview_binding.dart';
import '../modules/webview/views/webview_view.dart';

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
