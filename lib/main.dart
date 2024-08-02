import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';

import 'package:mark_jinxiaoman/app/routes/app_pages.dart';
import 'package:mark_jinxiaoman/app/services/loading_service.dart';
import 'package:mark_jinxiaoman/app/services/toast_service.dart';
import 'package:mark_jinxiaoman/app/ui/theme/dark_theme.dart';
import 'package:mark_jinxiaoman/app/ui/theme/light_theme.dart';
import 'package:mark_jinxiaoman/app/utils/logger.dart';
import 'package:mark_jinxiaoman/config/app_config.dart';
import 'package:mark_jinxiaoman/generated/locales.g.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await _initializeApp();

  FlutterNativeSplash.remove();
}

Future<void> _initializeApp() async {
  final appConfig = AppConfig();
  await appConfig.init();
  Get.put(appConfig);
  Get.put(ToastService()); // 注册 ToastService
  Get.put(LoadingService()); // 注册 LoadingService

  final locale = appConfig.currentLocale;
  final themeMode = appConfig.themeMode;

  // await Future.delayed(Duration(seconds: 1));//模拟初始化数据

  runApp(MyApp(locale: locale, themeMode: themeMode));
}

class MyApp extends StatelessWidget {
  final Locale locale;
  final ThemeMode themeMode;

  MyApp({required this.locale, required this.themeMode});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    AppLogger.i("缓存中的国际化语言索引--,$locale");
    AppLogger.i("缓存中的themeMode--,$themeMode");

    return ScreenUtilInit(
      designSize: Get.find<AppConfig>().designSize,
      builder: (context, child) {
        return OKToast(
          child: GetMaterialApp(
            enableLog: true,
            theme: LightTheme.theme,
            darkTheme: DarkTheme.theme,
            themeMode: themeMode,
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
            translationsKeys: AppTranslation.translations,
            locale: locale,
            fallbackLocale: Get.find<AppConfig>().fallbackLocale,
            supportedLocales: Get.find<AppConfig>().supportedLocales,
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            builder: (context, widget) {
              Get.find<ToastService>().init(context);
              Get.find<LoadingService>().init(context);
              return MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(textScaler: TextScaler.linear(1.0)),
                child: widget ?? Container(),
              );
            },
          ),
        );
      },
    );
  }
}
